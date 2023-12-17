import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:keysmith/src/features/add/presentation/states/add_password_cubit.dart';
import 'package:keysmith/src/features/add/presentation/states/add_password_state.dart';
import 'package:keysmith/src/features/add/presentation/views/add_password_view.dart';
import 'package:keysmith/src/features/add/presentation/widgets/input_text_field_widget.dart';
import 'package:mockito/mockito.dart';

class MockStorage extends Mock implements Storage {
  @override
  Future<void> write(String key, dynamic value) async {}
}

void initHydratedBloc() {
  final hydratedStorage = MockStorage();
  TestWidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = hydratedStorage;
}

class FakeAddPasswordCubit extends AddPasswordCubit {
  @override
  AddPasswordState? fromJson(Map<String, dynamic> json) =>
      const AddPasswordState();

  @override
  Future<void> saveSecret() => Future(() => debugPrint('saveSecret called.'));

  @override
  Map<String, dynamic>? toJson(AddPasswordState state) => {};

  @override
  void updateEmailString(String email) => debugPrint('updateEmail called.');

  @override
  void updatePasswordString(String password) =>
      debugPrint('updatePassword called.');

  @override
  void updateTitleString(String title) => debugPrint('updateTitle called.');

  @override
  void updateWebsiteUrl(String website) => debugPrint('updateUrl called.');
}

void main() {
  initHydratedBloc();
  Widget? sut;
  AddPasswordCubit? fakeCubit;
  const validEmail = 'valid@email.com';
  const validWebsite = 'www.website.com';

  Widget materialAppWrapper(Widget child, AddPasswordCubit mockCubit,
          [ThemeData? theme]) =>
      BlocProvider(
        create: (context) => mockCubit,
        child: MaterialApp(
          theme: theme,
          home: Scaffold(body: child),
        ),
      );

  setUp(() {
    fakeCubit = FakeAddPasswordCubit();
    sut = const AddPasswordView();
  });

  testWidgets("Initially all the textfields are empty.", (tester) async {
    //ARRANGE
    await tester.pumpWidget(materialAppWrapper(sut!, fakeCubit!));

    //ACT
    final findTitleField = find.byWidgetPredicate(
      (widget) =>
          widget is TextField &&
          widget.decoration!.hintText == "Title" &&
          widget.controller!.text.isEmpty,
    );

    final findLoginField = find.byWidgetPredicate(
      (widget) =>
          widget is InputTextFieldWidget &&
          widget.label == "Login" &&
          widget.controller!.text.isEmpty,
    );
    final findPasswordField = find.byWidgetPredicate(
      (widget) =>
          widget is InputTextFieldWidget &&
          widget.label == "Password" &&
          widget.controller!.text.isEmpty,
    );
    final findWebsiteField = find.byWidgetPredicate(
      (widget) =>
          widget is InputTextFieldWidget &&
          widget.label == "Website" &&
          widget.controller!.text.isEmpty,
    );

    //ASSERT
    expect(findTitleField, findsOneWidget);
    expect(findLoginField, findsOneWidget);
    expect(findPasswordField, findsOneWidget);
    expect(findWebsiteField, findsOneWidget);
  });

  testWidgets('Displays previously entered title in the title textfield.',
      (tester) async {
    //ARRANGE
    const testText = "An old title";
    final testInput = fakeCubit!.state.copyWith(title: testText);
    fakeCubit!.emit(testInput);
    await tester.pumpWidget(materialAppWrapper(sut!, fakeCubit!));

    //ACT
    final findTitleField = find.byWidgetPredicate(
      (widget) =>
          widget is TextField &&
          widget.decoration!.hintText == "Title" &&
          widget.controller!.text == testText,
    );

    //ASSERT
    expect(findTitleField, findsOneWidget);
  });

  testWidgets(
      'when text is entered by user in the title textfield, the state should not update the text.',
      (tester) async {
    //ARRANGE

    //ACT

    //ASSERT
  });

  testWidgets('Displays previously entered email in the email textfield.',
      (tester) async {
    //ARRANGE

    //ACT

    //ASSERT
  });

  testWidgets('Displays previously entered password in the password textfield.',
      (tester) async {
    //ARRANGE

    //ACT

    //ASSERT
  });

  testWidgets('Displays previously entered web url in the website textfield',
      (tester) async {
    //ARRANGE

    //ACT

    //ASSERT
  });
}
