part of 'exp_floating_button_widget.dart';

class _ExpandingActionButton extends StatelessWidget {
  final Offset offset;
  final Animation<double> progress;
  final Widget child;
  final bool isExpanded;

  const _ExpandingActionButton({
    required this.offset,
    required this.progress,
    required this.isExpanded,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 250),
          bottom: isExpanded ? offset.dy : 0,
          child: child!,
        );
      },
      child: child,
    );
  }
}
