import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:keysmith/src/features/add/presentation/widgets/input_text_field_widget.dart';
import 'package:keysmith/src/features/add/utils/constants/password_strength_criteria.dart';

///Password field to enter a password for the secret.
/// Also provides options to generate passwords.
///
class PasswordFieldWidget extends HookWidget {
  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final void Function(Map<PasswordStrengthCriteria, bool> criteria)?
      onCriteriaChanged;

  ///Creates a password field with password generation options.
  const PasswordFieldWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.onCriteriaChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isMenuOpen = useState(false);
    return Row(
      children: [
        Expanded(
          child: InputTextFieldWidget(
            controller: controller,
            leadingIcon: Icons.key_outlined,
            onChanged: onChanged,
            label: "Password",
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: MenuAnchor(
            builder: (context, controller, child) => Card(
              child: IconButton(
                onPressed: () async {
                  print("passwordCriteriaPressed");
                  isMenuOpen.value = !isMenuOpen.value;
                  isMenuOpen.value ? controller.open() : controller.close();
                },
                icon: const Icon(Icons.lock_open_outlined),
              ),
            ),
            menuChildren: const [
              //TODO: create a dropdown menu item widget with checkbox lined up with a widget, which provides onPressed closure with a boolean
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("menuItem1"),
              )
            ],
            child: null,
          ),
        ),
      ],
    );
  }
}
/* 
Note: `InputTextFieldWidget` is wrapped in Expanded for 
following reason:
The `TextFormField` widget which is inside `InputTextFieldWidget` does 
not have a finite size, which means it will try to stretch beyond 
its parent's size, which is illegal. Hence, `TextFormField` 
must be within a costrainted width.

The 'Row' widget by design does not constrain its children, 
which means the children can define their own width. 
This conflicts with the contrain requirement of the 'TextField' widget, 
hence Flutter will throw an error and crash.

To resolve this, when a textfield is defined as child of 
an un-constrained widget such as 'Row', it can be wrapped in 'Expanded' provided
the parent 'Row' has another child. Since 'Row' will provided 'Expanded' its 
constraints based on other children it wraps. In turn, 'Expanded' will provide 
the 'TextField' its contstraints which satifies its requirement of 
width constraints. This way 'TextField' will stretch as much as it wants 
within the constraints given by 'Expanded'.
*/
