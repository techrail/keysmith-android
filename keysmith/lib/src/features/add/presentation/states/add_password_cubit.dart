import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:keysmith/src/features/add/presentation/states/add_password_state.dart';

abstract class AddPasswordCubit extends HydratedCubit<AddPasswordState> {
  AddPasswordCubit() : super(const AddPasswordState());

  void updateTitleString(String title);

  void updateEmailString(String email);

  void updatePasswordString(String password);

  void updateWebsiteUrl(String website);

  Future<void> saveSecret();
}
