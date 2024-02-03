import 'package:injectable/injectable.dart';
import 'package:keysmith/src/core/utils/error/failures.dart';
import 'package:keysmith/src/core/utils/state/app_state.dart';
import 'package:keysmith/src/features/add/domain/usecases/add_usecases.dart';
import 'package:keysmith/src/features/add/presentation/states/add_password_cubit.dart';
import 'package:keysmith/src/features/add/presentation/states/add_password_state.dart';
import 'package:keysmith/src/features/add/presentation/states/errors.dart';
import 'package:keysmith/src/features/add/presentation/states/state_model.dart';

//TODO: create repository abstractions and write tests.

@Singleton(as: AddPasswordCubit)
class AddPasswordCubitImpl extends AddPasswordCubit {
  //TODO: usecases for email validation
  final AddPasswordUsecase _addPasswordUseCase;
  final PasswordStrengthUsecase _passwordStrengthUsecase;

  AddPasswordCubitImpl({
    required AddPasswordUsecase addPasswordUseCase,
    required PasswordStrengthUsecase passwordStrengthUsecase,
  })  : _addPasswordUseCase = addPasswordUseCase,
        _passwordStrengthUsecase = passwordStrengthUsecase;

  @override
  Future<void> saveSecret() async {
    emit(state.copyWith(appState: AppState.success));
    //TODO: make sure all the fields are validated.

    //2. save the password to storage.
    final result = await _addPasswordUseCase.call(AddPasswordParams(
      title: state.title,
      email: state.email,
      password: state.password,
      website: state.website,
    ));

    result.fold(_ifLeft, _ifRight);
  }

  void _ifLeft(Failure failure) => emit(state.copyWith(
        appState: AppState.error,
        errors: {
          //TODO: observe error handling
          AddPasswordError.other:
              failure.message ?? "An error occured while saving the password"
        },
      ));

  void _ifRight(void _) =>
      emit(state.copyWith(appState: AppState.success, errors: null));

  @override
  void updateEmailString(String email) => emit(state.copyWith(email: email));

  @override
  void updatePasswordString(String password) {
    final passwordStrength =
        _passwordStrengthUsecase(PasswordStrengthParams(password: password));

    emit(state.copyWith(password: password, strength: passwordStrength));
  }

  @override
  void updateTitleString(String title) => emit(state.copyWith(title: title));
  @override
  void updateWebsiteUrl(String website) =>
      emit(state.copyWith(website: website));

  @override
  Future<void> reset() async {
    clear();
    emit(const AddPasswordState());
  }

  @override
  Map<String, dynamic>? toJson(AddPasswordState state) => AddPasswordStateModel(
        appState: state.appState,
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
