import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yumquick/core/networking/api_result.dart';
import 'package:yumquick/features/auth/signup/data/models/signup_request_model.dart';
import 'package:yumquick/features/auth/signup/data/repos/signup_repo.dart';
import 'package:yumquick/features/auth/signup/logic/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(SignupState.signInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  Future<void> signup() async {
    emit(const SignupState.signLoading());
    final response = await _signupRepo.signup(
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
}
