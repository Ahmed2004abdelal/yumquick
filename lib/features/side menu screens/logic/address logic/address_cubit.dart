import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
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
    emit(state.copyWith(getAddressStatus: AddressStatus.loading));
    if (isClosed) return;
    final response = await _addressRepo.getAddress();

    if (isClosed) return;
    response.when(
      success: (data) {
        emit(
          state.copyWith(
            getAddressStatus: AddressStatus.success,
            addresses: data,
            defaultAddressId: data.isNotEmpty ? data.first.id : null,
          ),
        );
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
        emit(
          state.copyWith(
            setDefaultAddressStatus: AddressStatus.success,
            setDefaultAddressSuccessMessage: data.message,
          ),
        );
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
