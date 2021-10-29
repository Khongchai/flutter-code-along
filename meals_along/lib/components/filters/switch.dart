import "package:flutter/material.dart";

class CustomSwitch extends StatelessWidget {
  final VoidCallback onChanged;
  final bool switchState;
  final String title;

  const CustomSwitch(
      {required this.title,
      required this.switchState,
      required this.onChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        title: Text(title),
        value: switchState,
        subtitle: const Text("Only include gluten free meals"),
        activeColor: Theme.of(context).colorScheme.secondary,
        onChanged: (_) => onChanged());
  }
}
