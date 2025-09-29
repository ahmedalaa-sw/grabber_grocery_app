// import 'package:bloc/bloc.dart';
// import 'login_state.dart';

// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit() : super(LoginInitial());

//   bool isPasswordVisible = false;
//   bool isConfirmPasswordVisible = false;

//   void togglePasswordVisibility() {
//     isPasswordVisible = !isPasswordVisible;
//     emit(PasswordVisibilityChanged(isPasswordVisible));
//   }

//   void toggleConfirmPasswordVisibility() {
//     isConfirmPasswordVisible = !isConfirmPasswordVisible;
//     emit(ConfirmPasswordVisibilityChanged(isConfirmPasswordVisible));
//   }

//   void login({required String email, required String password}) async {
//     emit(LoginLoading());
//     await Future.delayed(const Duration(seconds: 2)); // simulate API
//     if (email == "test@example.com" && password == "123456") {
//       emit(LoginSuccess());
//     } else {
//       emit(LoginError("Invalid email or password"));
//     }
//   }

//   void register({
//     required String name,
//     required String email,
//     required String password,
//     required String confirmPassword,
//   }) async {
//     emit(LoginLoading());
//     await Future.delayed(const Duration(seconds: 2)); // simulate API
//     if (password != confirmPassword) {
//       emit(LoginError("Passwords do not match"));
//     } else {
//       // Assume success
//       emit(LoginSuccess());
//     }
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordVisibilityCubit extends Cubit<bool> {
  PasswordVisibilityCubit() : super(true);

  void toggleVisibility() => emit(!state);
}
