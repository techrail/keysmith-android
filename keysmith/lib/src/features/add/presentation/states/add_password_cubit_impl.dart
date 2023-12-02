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
  final AddPasswordUseCase _addPasswordUseCase;

  AddPasswordCubitImpl({
    required AddPasswordUseCase addPasswordUseCase,
  }) : _addPasswordUseCase = addPasswordUseCase;

  @override
  Future<void> saveSecret() async {
    //1. make sure all the fields are validated.

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
        status: AppState.error,
        errors: {
          AddPasswordError.other:
              failure.message ?? "An error occured while saving the password"
        },
      ));

  void _ifRight(void _) =>
      emit(state.copyWith(status: AppState.success, errors: null));

  @override
  void updateEmailString() {
    // TODO: implement updateEmailString
  }

  @override
  void updatePasswordString() {
    // TODO: implement updatePasswordString
  }

  @override
  void updateTitleString() {
    // TODO: implement updateTitleString
  }

  @override
  void updateWebsiteUrl() {
    // TODO: implement updateWebsiteUrl
  }

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
