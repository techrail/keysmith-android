part of 'exp_floating_button_widget.dart';

Widget _buildOpenButton({
  required bool isOpen,
  void Function()? onPressed,
}) {
  return IgnorePointer(
    ignoring: isOpen,
    child: AnimatedContainer(
      transformAlignment: Alignment.center,
      transform: Matrix4.diagonal3Values(
        isOpen ? 0.7 : 1.0,
        isOpen ? 0.7 : 1.0,
        1.0,
      ),
      curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      duration: const Duration(milliseconds: 250),
      child: AnimatedOpacity(
        opacity: isOpen ? 0.0 : 1.0,
        curve: const Interval(0.25, 1.0, curve: Curves.easeOut),
        duration: const Duration(milliseconds: 250),
        child: FloatingActionButton(
          onPressed: onPressed,
          child: const Icon(Icons.create),
        ),
      ),
    ),
  );
}
