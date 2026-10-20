import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState<T> with _$LoginState<T> {
  const factory LoginState.loginInitial() = _LoginInitial;
  const factory LoginState.loginLoading() = _LoginLoading;
  const factory LoginState.loginSuccess(T data) = _LoginSuccess<T>;
  const factory LoginState.loginError(String message) = _LoginError;
}
