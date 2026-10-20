import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref_helper.dart';
import '../../../../core/networking/api_result.dart';
import '../../repos/auth_repos.dart';
import '../data/models/signup_request_model.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepos _authRepos;
  SignupCubit(this._authRepos) : super(SignupState.signInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Future<void> close() {
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    mobileController.dispose();
    return super.close();
  }

  Future<void> signup() async {
    emit(const SignupState.signLoading());
    final response = await _authRepos.signup(
      SignupRequestModel(
        email: emailController.text.trim(),
        fullName: nameController.text,
        password: passwordController.text.trim(),
        phoneNumber: mobileController.text.trim(),
        //role: "Customer",
      ),
    );
    response.when(
      success: (signupRequestModel) {
        emit(SignupState.signSuccess(signupRequestModel));
      },
      failure: (error) {
        emit(
          SignupState.signError(
            error.apiErrorModel.message ?? "========error========",
          ),
        );
      },
    );
  }

  Future<void> googleOauth() async {
    emit(SignupState.signLoading());
    if (isClosed) return;
    final response = await _authRepos.googleOauth();
    response.when(
      success: (signupResponseModel) async {
        final token = signupResponseModel.token;
        if (token != null && token.isNotEmpty) {
          await SharedPrefHelper.setSecuredString(
            SharedPrefKeys.userToken,
            token,
          );
        }
        emit(SignupState.signGoogleSuccess(signupResponseModel));
      },
      failure: (error) {
        emit(
          SignupState.signError(
            error.apiErrorModel.message ?? "========error========",
          ),
        );
      },
    );
  }
}
