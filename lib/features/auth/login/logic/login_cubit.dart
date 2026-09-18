import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yumquick/core/networking/api_result.dart';
import 'package:yumquick/features/auth/login/data/models/login_request_model.dart';
import 'package:yumquick/features/auth/login/data/repo/login_repo.dart';
import 'package:yumquick/features/auth/login/logic/login_state.dart';

import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref_helper.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.loginInitial());

  final TextEditingController userIdentifierController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Future<void> close() {
    userIdentifierController.dispose();
    passwordController.dispose();
    return super.close();
  }

  Future<void> googleOauth() async {
    emit(LoginState.loginLoading());
    if (isClosed) return;
    final response = await _loginRepo.googleOauth();
    response.when(
      success: (loginResponseModel) async {
        final token = loginResponseModel.token;
        if (token != null && token.isNotEmpty) {
          await SharedPrefHelper.setSecuredString(
            SharedPrefKeys.userToken,
            token,
          );
        }
        emit(LoginState.loginSuccess(loginResponseModel));
      },
      failure: (error) {
        emit(
          LoginState.loginError(
            error.apiErrorModel.message ?? "========error========",
          ),
        );
      },
    );
  }

  Future<void> login() async {
    emit(LoginState.loginLoading());
    final response = await _loginRepo.login(
      LoginRequestModel(
        identifier: userIdentifierController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );
    response.when(
      success: (loginResponseModel) async {
        final token = loginResponseModel.token;
        if (token != null && token.isNotEmpty) {
          await SharedPrefHelper.setSecuredString(
            SharedPrefKeys.userToken,
            token,
          );
        }
        emit(LoginState.loginSuccess(loginResponseModel));
      },
      failure: (error) {
        emit(
          LoginState.loginError(
            error.apiErrorModel.message ?? "========error========",
          ),
        );
      },
    );
  }
}
