import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:keysmith/src/features/add/presentation/states/add_password_state.dart';

abstract class AddPasswordCubit extends HydratedCubit<AddPasswordState> {
  AddPasswordCubit() : super(const AddPasswordState());

  void updateTitleString();

  void updateEmailString();

  void updatePasswordString();

  void updateWebsiteUrl();

  Future<void> saveSecret();
}
