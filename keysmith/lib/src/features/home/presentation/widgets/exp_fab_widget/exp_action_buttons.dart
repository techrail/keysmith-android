part of 'exp_floating_button_widget.dart';

List<Widget> _buildExpandingActionButtons({
  required List<Widget> children,
  required Animation<double> animation,
  required bool isOpen,
}) {
  final List<Widget> widgets = [];
  final count = children.length;
  for (var i = 0, distanceFromBottom = 80.0;
      i < count;
      i++, distanceFromBottom *= (i + 1)) {
    widgets.add(
      _ExpandingActionButton(
        offset: Offset(0, distanceFromBottom),
        progress: animation,
        isExpanded: isOpen,
        child: children[i],
      ),
    );
  }
  return widgets;
}
