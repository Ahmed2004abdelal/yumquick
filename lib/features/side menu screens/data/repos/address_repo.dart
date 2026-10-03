import 'package:yumquick/core/networking/api_error_handler.dart';
import 'package:yumquick/core/networking/api_result.dart';
import 'package:yumquick/core/networking/api_service.dart';
import 'package:yumquick/core/utils/models/deafult_response.dart';
import 'package:yumquick/features/side%20menu%20screens/data/models/address%20models/add_address_request.dart';
import 'package:yumquick/features/side%20menu%20screens/data/models/address%20models/add_address_response.dart';
import 'package:yumquick/features/side%20menu%20screens/data/models/address%20models/get_address_response.dart';

class AddressRepo {
  final ApiService _apiService;
  AddressRepo(this._apiService);

  Future<ApiResult<AddAddressResponse>> addAddress(
    AddAddressRequest addAddressRequest,
  ) async {
    try {
      final response = await _apiService.addAddress(addAddressRequest);
      await setDefaultAddress(response.addressId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<GetAddressResponse>>> getAddress() async {
    try {
      final response = await _apiService.getAddress();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultResponse>> setDefaultAddress(int addressId) async {
    try {
      final response = await _apiService.setDefaultAddress(addressId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
