import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
abstract class SignupState<T> with _$SignupState<T> {
  const factory SignupState.signInitial() = _SignInitial;
  const factory SignupState.signLoading() = _SignupLoading;
  const factory SignupState.signSuccess(T data) = _SignupSuccess<T>;
  const factory SignupState.signError(String message) = _SignupError;
}
