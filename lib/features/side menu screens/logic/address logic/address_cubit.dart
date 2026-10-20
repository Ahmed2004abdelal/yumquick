import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:yumquick/core/helper/constants.dart';
import 'package:yumquick/core/helper/shared_pref_helper.dart';
import 'package:yumquick/core/networking/api_result.dart';
import 'package:yumquick/features/side%20menu%20screens/data/models/address%20models/add_address_request.dart';
import 'package:yumquick/features/side%20menu%20screens/data/repos/address_repo.dart';
import 'package:yumquick/features/side%20menu%20screens/logic/address%20logic/address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddressRepo _addressRepo;
  AddressCubit(this._addressRepo) : super(AddressState()) {
    getAddresses();
  }
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Future<void> close() {
    nameController.dispose();
    addressController.dispose();
    return super.close();
  }

  // Method to add an address
  Future<void> addAddress() async {
    emit(state.copyWith(addAddressStatus: AddressStatus.loading));
    if (isClosed) return;
    final response = await _addressRepo.addAddress(
      AddAddressRequest(
        name: nameController.text,
        address: addressController.text,
      ),
    );

    if (isClosed) return;
    response.when(
      success: (data) {
        emit(
          state.copyWith(
            addAddressStatus: AddressStatus.success,
            addAddressSuccessMessage: data.message,
            // defaultAddressId: data.
          ),
        );
        nameController.clear();
        addressController.clear();
        getAddresses();
      },
      failure: (message) {
        emit(
          state.copyWith(
            addAddressStatus: AddressStatus.failure,
            addAddressError:
                message.apiErrorModel.message ?? "An error occurred",
          ),
        );
      },
    );
  }

  // Method to get addresses
  Future<void> getAddresses() async {
    if (state.addresses.isEmpty) {
      emit(state.copyWith(getAddressStatus: AddressStatus.loading));
    }
    if (isClosed) return;
    final response = await _addressRepo.getAddress();

    if (isClosed) return;
    response.when(
      success: (data) {
        final defaultAddress = data.isEmpty
            ? null
            : data.firstWhere((a) => a.isDefault, orElse: () => data.first);

        emit(
          state.copyWith(
            getAddressStatus: AddressStatus.success,
            addresses: data,
            defaultAddressId: defaultAddress?.id,
          ),
        );
        if (defaultAddress != null) {
          SharedPrefHelper.setData(
            SharedPrefKeys.defaultAddress,
            defaultAddress.address,
          );
          SharedPrefHelper.setData(
            SharedPrefKeys.defaultAddressId,
            defaultAddress.id,
          );
        } else {
          SharedPrefHelper.removeData(SharedPrefKeys.defaultAddress);
          SharedPrefHelper.removeData(SharedPrefKeys.defaultAddressId);
        }
      },
      failure: (message) {
        emit(
          state.copyWith(
            getAddressStatus: AddressStatus.failure,
            getAddressError:
                message.apiErrorModel.message ?? "An error occurred",
          ),
        );
      },
    );
  }

  // Method to set default address
  Future<void> setDefaultAddress(int addressId) async {
    emit(state.copyWith(setDefaultAddressStatus: AddressStatus.loading));
    if (isClosed) return;
    final response = await _addressRepo.setDefaultAddress(addressId);
    if (isClosed) return;
    response.when(
      success: (data) {
        final selected = state.addresses.firstWhere(
          (a) => a.id == addressId,
          orElse: () => state.addresses.first,
        );

        emit(
          state.copyWith(
            setDefaultAddressStatus: AddressStatus.success,
            setDefaultAddressSuccessMessage: data.message,
            defaultAddressId: addressId,
          ),
        );

        SharedPrefHelper.setData(
          SharedPrefKeys.defaultAddress,
          selected.address,
        );
        SharedPrefHelper.setData(SharedPrefKeys.defaultAddressId, selected.id);
      },
      failure: (message) {
        emit(
          state.copyWith(
            setDefaultAddressStatus: AddressStatus.failure,
            setDefaultAddressError:
                message.apiErrorModel.message ?? "An error occurred",
          ),
        );
      },
    );
  }
}
