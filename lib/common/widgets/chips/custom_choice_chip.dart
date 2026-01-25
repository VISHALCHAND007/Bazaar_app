import 'package:e_commerce/common/widgets/customShapes/containers/rounded_container.dart';
import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({super.key, required this.label, required this.selected, this.onSelected});

  final String label;
  final bool selected;
  final Function(bool)? onSelected;


  @override
  Widget build(BuildContext context) {
    final color = Helpers.getColor(label);
    final isColorAvailable = color != null;

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColorAvailable ? const SizedBox() : Text(label),
        labelStyle: TextStyle(color: selected ? MyColors.white : null),
        selected: selected,
        onSelected: onSelected,
        shape: isColorAvailable ? const CircleBorder(): null,
        avatar: isColorAvailable ? RoundedContainer(height: 50, width: 50, backgroundColor: color,): null,
        backgroundColor: isColorAvailable ? color : null,
        padding: isColorAvailable ? .zero: null,
        labelPadding: isColorAvailable ? .zero: null,
      ),
    );
  }
}
