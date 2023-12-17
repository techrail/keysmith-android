import 'package:injectable/injectable.dart';
import 'package:keysmith/src/core/utils/error/failures.dart';
import 'package:keysmith/src/core/utils/state/app_state.dart';
import 'package:keysmith/src/features/add/presentation/states/add_password_cubit.dart';
import 'package:keysmith/src/features/add/presentation/states/add_password_state.dart';
import 'package:keysmith/src/features/add/presentation/states/errors.dart';
import 'package:keysmith/src/features/add/presentation/states/state_model.dart';

//TODO: create repository abstractions and write tests.
@Singleton(as: AddPasswordCubit)
class AddPasswordCubitImpl extends AddPasswordCubit {
  // final AddPasswordUseCase _addPasswordUseCase;

  AddPasswordCubitImpl();

  @override
  Future<void> saveSecret() async {
    //1. make sure all the fields are validated.

    //2. save the password to storage.
    // final result = await _addPasswordUseCase.call(AddPasswordParams(
    //   title: state.title,
    //   email: state.email,
    //   password: state.password,
    //   website: state.website,
    // ));

    // result.fold(_ifLeft, _ifRight);
  }

  void _ifLeft(Failure failure) => emit(state.copyWith(
        status: AppState.error,
        errors: {
          AddPasswordError.other:
              failure.message ?? "An error occured while saving the password"
        },
      ));

  void _ifRight(void _) =>
      emit(state.copyWith(status: AppState.success, errors: null));

  @override
  void updateEmailString(String email) => emit(state.copyWith(email: email));

  @override
  void updatePasswordString(String password) =>
      emit(state.copyWith(password: password));

  @override
  void updateTitleString(String title) => emit(state.copyWith(title: title));
  @override
  void updateWebsiteUrl(String website) =>
      emit(state.copyWith(website: website));

  @override
  Map<String, dynamic>? toJson(AddPasswordState state) => AddPasswordStateModel(
        status: state.status,
        title: state.title,
        email: state.email,
        password: state.password,
        website: state.website,
        siteImageUrl: state.siteImageUrl,
        validEmail: state.validEmail,
        validUrl: state.validUrl,
        strength: state.strength,
        errors: state.errors,
      ).toMap();

  @override
  AddPasswordState? fromJson(Map<String, dynamic> json) =>
      AddPasswordStateModel.fromMap(json);
}
