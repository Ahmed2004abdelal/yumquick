# YumQuick - Order & Payment Feature Implementation Report

**Branch:** `features/order`
**Commit:** `df57c07` - "create order and payment feature"
**Date:** October 8, 2026

---

## Executive Summary

This branch implements a complete **Order & Payment system** for the YumQuick food delivery app. The feature enables users to:

1. Review their cart and proceed to checkout
2. Select/manage shipping addresses
3. Choose payment method (Cash on Delivery or Card)
4. Save and manage payment cards via Stripe integration
5. Process payments securely
6. View order confirmation

---

## Architecture Overview

The implementation follows **Clean Architecture** with **BLoC pattern** for state management:

```
lib/features/
├── checkout/                    # Checkout flow feature
│   ├── data/
│   │   ├── models/              # CheckoutRequest, CheckoutResponse, CheckoutScreenModel
│   │   └── repos/               # CheckoutRepo
│   ├── logic/
│   │   ├── checkout_cubit.dart  # State management for checkout flow
│   │   ├── checkout_state.dart  # Freezed state definitions
│   │   └── checkout_state.freezed.dart
│   └── ui/screens/
│       ├── checkout_screen.dart        # Address selection, payment type, order summary
│       ├── order_payment_screen.dart   # Payment processing screen
│       └── order_confirmed_screen.dart # Success confirmation
│
├── side menu screens/
│   ├── data/
│   │   ├── models/
│   │   │   ├── address models/         # GetAddressResponse, AddAddressRequest/Response
│   │   │   └── payment models/         # SavedCardModel, SavePaymentMethodRequest
│   │   └── repos/
│   │       ├── address_repo.dart
│   │       └── payment_repo.dart
│   ├── logic/
│   │   ├── address logic/              # AddressCubit, AddressState
│   │   └── payment logic/              # PaymentCubit, PaymentState
│   └── ui/screens/
│       ├── address_screen.dart              # Manage addresses
│       ├── add_new_address_screen.dart      # Add new address
│       ├── payment_methods_screen.dart      # View/manage saved cards
│       └── add_card_screen.dart             # Add new card via Stripe
```

---

## Core Features Implemented

### 1. Checkout Flow (`lib/features/checkout/`)

#### **Checkout Screen** (`checkout_screen.dart`)
- **Shipping Address Selection**: Displays saved default address; allows navigation to address management
- **Payment Method Toggle**: Switch between **Cash** and **Card** (saved card)
- **Order Summary**: Lists all cart items with quantity, price, and remove option
- **Total Price Calculation**: Real-time updates when items are removed
- **Place Order Button**: Navigates to payment screen with the `CheckoutCubit`

#### **Order Payment Screen** (`order_payment_screen.dart`)
- **Order Summary**: Compact view of items and total
- **Payment Method Display**: Shows saved card (brand + last 4 digits) or "No saved card" state
- **Delivery Time Estimate**: Static "25-35 min" display
- **Pay Now Button**: Triggers payment processing via `CheckoutCubit.payment()`

#### **Order Confirmed Screen** (`order_confirmed_screen.dart`)
- Success animation with checkmark
- Order confirmation message
- Estimated delivery date/time
- "Home" button to return to main screen (clears navigation stack)

#### **Checkout Cubit** (`checkout_cubit.dart`)
Manages the complete checkout state machine:
- `CheckoutStatus`: `initial` → `loading` → `success`/`failure`
- **Address Loading**: Reads default address from `SharedPreferences`
- **Saved Card Loading**: Reads selected card from `SharedPreferences`
- **Item Removal**: Optimistic UI update with rollback on API failure
- **Payment Processing**:
  - Validates address selection
  - Determines payment type: `SavedCard` vs `Card`
  - Calls `CheckoutRepo.checkout()` → receives `clientSecret`
  - Uses `StripePaymentService` for payment confirmation
  - Handles success/cancel/failure outcomes

#### **Data Models**
```dart
// CheckoutRequest - Sent to API
{
  addressId: int,
  paymentMethod: "Cash" | "Card" | "SavedCard",
  couponCode?: string,
  savedCardId?: int
}

// CheckoutResponse - From API
{
  message: string,
  orderId: int,
  clientSecret?: string  // For Stripe payment
}

// CheckoutScreenModel - UI data passed from Cart
{
  products: List<CartProduct>,
  totalPrice: double,
  itemCount: int
}
```

---

### 2. Payment Management (`lib/features/side menu screens/`)

#### **Payment Methods Screen** (`payment_methods_screen.dart`)
- Lists all saved cards with brand and last 4 digits
- Radio selection for default card
- "Add New Card" button → navigates to `AddCardScreen`
- Tap a card to set as default (calls `PaymentCubit.setDefaultCard()`)

#### **Add Card Screen** (`add_card_screen.dart`)
- Uses `flutter_stripe` `CardFormField` for secure card input
- Validates card completeness before submission
- On save: Creates Stripe PaymentMethod → sends token to backend → refreshes card list

#### **Payment Cubit** (`payment_cubit.dart`)
- **Load Cards**: Fetches from `PaymentRepo.getCards()`, auto-selects default
- **Save Card**: 
  1. Creates Stripe PaymentMethod (`_stripe.createPaymentMethod()`)
  2. Sends token to backend (`PaymentRepo.saveCard()`)
  3. Reloads card list
- **Set Default Card**: Updates backend + local `SharedPreferences`
- **Selected Card Persistence**: Saves `cardId`, `brand`, `lastFourDigits` to `SharedPreferences` for checkout flow

#### **Payment Data Models**
```dart
// SavedCardModel
{
  id: int,
  lastFourDigits: string,
  brand: string,  // "Visa", "Mastercard", etc.
  isDefault: bool
}

// SavePaymentMethodRequest
{
  token: string,           // Stripe PaymentMethod ID
  lastFourDigits: string,
  brand: string
}
```

---

### 3. Address Management (Enhanced)

#### **Address Screen** (`address_screen.dart`)
- Displays saved addresses
- Set default address
- Navigate to add new address

#### **Add New Address Screen** (`add_new_address_screen.dart`)
- Form for adding new delivery address
- Integrates with `AddressCubit`

#### **Address Cubit** (`address_cubit.dart`)
- Manages address list and default selection
- Persists default address ID to `SharedPreferences`

---

### 4. Stripe Integration (`lib/core/networking/stripe_payment_service.dart`)

```dart
class StripePaymentService {
  // Scenario 1: New card payment via Payment Sheet
  Future<StripeResult> payWithPaymentSheet(String clientSecret)
  
  // Scenario 2: Save new card (creates PaymentMethod)
  Future<SavePaymentMethodRequest> createPaymentMethod()
  
  // Scenario 3: Saved card payment via confirmPayment
  Future<StripeResult> confirmWithClientSecret(String clientSecret)
}
```

**Payment Flow:**
1. **New Card (Card)**: `checkout` → `clientSecret` → `presentPaymentSheet()` → 3D Secure if needed
2. **Saved Card**: `checkout` (with `savedCardId`) → `clientSecret` → `confirmPayment()` → No UI sheet needed

**Error Handling:**
- `StripeOutcome`: `success` | `canceled` | `failed`
- Maps `StripeException` codes to user-friendly messages
- Handles `FailureCode.Canceled` separately for user cancellation

---

### 5. Cart Integration (`lib/features/cart/ui/cart_screen.dart`)

The cart screen now includes a **"Proceed to Checkout"** button that:
1. Creates `CheckoutScreenModel` from current cart state
2. Navigates to `Routes.checkout` with the model as arguments
3. On return, refreshes cart data

---

## Navigation & Routing

### **New Routes Added** (`lib/core/Routing/routes.dart`)
| Route | Screen | Arguments |
|-------|--------|-----------|
| `checkout` | `CheckoutScreen` | `CheckoutScreenModel` |
| `orderPayment` | `OrderPaymentScreen` | `CheckoutCubit` (passed by value) |
| `orderConfirmedScreen` | `OrderConfirmedScreen` | None |
| `addressScreen` | `AddressScreen` | None |
| `addNewAddressScreen` | `AddNewAddressScreen` | `AddressCubit` |
| `paymentMethodsScreen` | `PaymentMethodsScreen` | None |
| `addCardScreen` | `AddCardScreen` | `PaymentCubit` |

### **Route Configuration** (`app_routing.dart`)
- Uses `BlocProvider` for new cubits
- Passes existing cubits via `.value()` for multi-screen flows (checkout → payment)
- Dependency injection via `getIt`

---

## Dependency Injection (`lib/core/di/dependency_injection.dart`)

```dart
// Stripe Service (Singleton)
getIt.registerLazySingleton<StripePaymentService>(() => StripePaymentService());

// Checkout
getIt.registerLazySingleton<CheckoutRepo>(() => CheckoutRepo(getIt()));

// Address
getIt.registerLazySingleton<AddressRepo>(() => AddressRepo(getIt()));
getIt.registerFactory<AddressCubit>(() => AddressCubit(getIt()));

// Payment
getIt.registerFactory<PaymentCubit>(() => PaymentCubit(getIt(), getIt()));
getIt.registerLazySingleton<PaymentRepo>(() => PaymentRepo(getIt()));
```

---

## API Endpoints (`lib/core/networking/api_service.dart` & `api_constants.dart`)

| Endpoint | Method | Purpose |
|----------|--------|---------|
| `Orders/checkout` | POST | Create order, returns `clientSecret` for Stripe |
| `PaymentMethods` | GET | List saved cards |
| `PaymentMethods` | POST | Save new card (token from Stripe) |
| `PaymentMethods/{cardId}/set-default` | PUT | Set default card |
| `Addresses` | GET | List addresses |
| `Addresses` | POST | Add new address |
| `Addresses/set-default/{addressId}` | PUT | Set default address |

---

## State Management Patterns

### **Freezed States**
All cubits use `freezed` for immutable state:
```dart
@freezed
abstract class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    @Default(CheckoutStatus.initial) CheckoutStatus checkoutStatus,
    @Default([]) List<CartProduct> products,
    @Default(0.0) double totalPrice,
    CheckoutResponse? checkoutSuccessResponse,
    String? checkoutError,
    @Default(true) bool cashPaymentSelected,
    SavedCardModel? selectedCard,
    GetAddressResponse? address,
  }) = _CheckoutState;
}
```

### **BlocListener Pattern**
UI screens use `BlocListener` for side effects (navigation, snackbars):
```dart
BlocListener<CheckoutCubit, CheckoutState>(
  listenWhen: (p, c) => p.checkoutStatus != c.checkoutStatus,
  listener: (context, state) {
    if (state.checkoutStatus == CheckoutStatus.success) {
      context.pushNamedAndRemoveUntil(Routes.orderConfirmedScreen, predicate: (r) => false);
    }
  },
  child: const SizedBox.shrink(),
)
```

---

## Key Technical Decisions

1. **Optimistic UI Updates**: Item removal in checkout updates UI immediately, rolls back on API failure
2. **SharedPreferences for Selections**: Default address and selected card cached locally for fast checkout loading
3. **Cubit Passing via Arguments**: `CheckoutCubit` passed from Checkout → Payment screen to maintain state
4. **Stripe PaymentMethod Tokens**: Never send raw card data to backend; only Stripe tokens
5. **Dual Payment Flow**: Supports both new card (PaymentSheet) and saved card (confirmPayment) flows
6. **Error Recovery**: Failed payments reset status to `initial` allowing retry

---

## Files Modified/Added (Summary)

### **New Files (~35)**
- Checkout feature: 10 files (models, repo, cubit, state, 3 screens)
- Payment management: 8 files (models, repo, cubit, state, 3 screens)
- Address management: 3 files (screen, cubit enhancements)
- Stripe service: 1 file
- Routing: 2 files (routes, app_routing additions)
- DI: 1 file additions

### **Modified Files (~20)**
- Cart screen: Added checkout navigation
- Home sidebar: Navigation to orders/payment/address
- API service: Added checkout & payment endpoints
- API constants: Added orders & payment endpoints
- Theme/styles: Minor UI adjustments
- Android/iOS config: Stripe/permission updates

---

## Testing Considerations

1. **Unit Tests Needed**:
   - `CheckoutCubit`: Payment flow logic, address/card loading, item removal
   - `PaymentCubit`: Card saving, default selection, loading states
   - `StripePaymentService`: Error mapping, outcome handling

2. **Widget Tests Needed**:
   - Checkout screen: Address display, payment toggle, item removal
   - Payment screen: Card display, pay button interaction
   - Add card screen: Form validation, save flow

3. **Integration Tests**:
   - Full checkout flow: Cart → Checkout → Payment → Confirmed
   - Card management: Add → Set Default → Use in Checkout

---

## Future Enhancements (Not in Scope)

- [ ] Coupon/Discount code support in checkout
- [ ] Order history / My Orders screen (partially exists)
- [ ] Push notifications for order status updates
- [ ] Apple Pay / Google Pay support
- [ ] Delivery tracking screen
- [ ] Order cancellation/refund flow
- [ ] Tip amount selection
- [ ] Multiple address selection per order

---

## Conclusion

The `features/order` branch delivers a **production-ready order and payment system** with:

✅ **Complete checkout flow** (address → payment → confirmation)  
✅ **Stripe integration** for secure card payments  
✅ **Saved card management** with default selection  
✅ **Address management** with default persistence  
✅ **Clean architecture** with BLoC state management  
✅ **Optimistic UI** for responsive user experience  
✅ **Proper error handling** and user feedback  

The implementation is modular, testable, and follows Flutter best practices.