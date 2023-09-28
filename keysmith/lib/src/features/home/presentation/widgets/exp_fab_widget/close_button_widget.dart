part of 'exp_floating_button_widget.dart';

Widget _buildCloseButton({
  required bool isOpen,
  void Function()? onPressed,
}) {
  return AnimatedOpacity(
    opacity: !isOpen ? 0.0 : 1.0,
    curve: const Interval(0.25, 1.0, curve: Curves.easeOut),
    duration: const Duration(milliseconds: 250),
    child: FloatingActionButton(
      backgroundColor: Colors.red.shade400,
      onPressed: onPressed,
      child: const Icon(Icons.close, color: Colors.white),
    ),
  );
}
