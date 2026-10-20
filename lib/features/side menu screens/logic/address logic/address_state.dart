import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumquick/features/side%20menu%20screens/data/models/address%20models/get_address_response.dart';

part 'address_state.freezed.dart';

@freezed
abstract class AddressState with _$AddressState {
  const factory AddressState({
    @Default(AddressStatus.initial) AddressStatus addAddressStatus,
    @Default(AddressStatus.initial) AddressStatus getAddressStatus,
    @Default(AddressStatus.initial) AddressStatus setDefaultAddressStatus,
    @Default('') String addAddressSuccessMessage,
    @Default('') String setDefaultAddressSuccessMessage,
    @Default([]) List<GetAddressResponse> addresses,
    @Default('') String addAddressError,
    @Default('') String getAddressError,
    @Default('') String setDefaultAddressError,
    int? defaultAddressId,
  }) = _AddressState;
}

enum AddressStatus { initial, loading, success, failure }
