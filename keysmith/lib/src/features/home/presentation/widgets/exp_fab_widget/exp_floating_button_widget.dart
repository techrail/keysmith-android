import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
part 'open_button_widget.dart';
part 'close_button_widget.dart';
part 'exp_action_buttons.dart';
part 'exp_action_button.dart';

class ExpFloatingButtonWidget extends HookWidget {
  final List<Widget> children;

  const ExpFloatingButtonWidget({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final isOpen = useState(false);

    final AnimationController controller = useAnimationController(
      upperBound: 1.0,
      lowerBound: 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: useSingleTickerProvider(),
    );

    final Animation<double> expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: controller,
    );

    void toggle() {
      isOpen.value = !isOpen.value;
      isOpen.value ? controller.forward() : controller.reverse();
    }

    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          ..._buildExpandingActionButtons(
            children: children,
            animation: expandAnimation,
            isOpen: isOpen.value,
          ),
          _buildCloseButton(
            isOpen: isOpen.value,
            onPressed: toggle,
          ),
          _buildOpenButton(
            isOpen: isOpen.value,
            onPressed: toggle,
          ),
        ],
      ),
    );
  }
}
