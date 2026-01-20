import 'package:flutter/material.dart';


class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = "View all",
    this.onPressed,
    this.textColor,
    this.showActionBtn = true,
  });

  final String title, buttonTitle;
  final Function()? onPressed;
  final Color? textColor;
  final bool showActionBtn;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: textColor),
            maxLines: 1,
            overflow: .ellipsis,
          ),
        ),
        if (showActionBtn)
          TextButton(onPressed: onPressed, child: Text(buttonTitle)),
      ],
    );
  }
}