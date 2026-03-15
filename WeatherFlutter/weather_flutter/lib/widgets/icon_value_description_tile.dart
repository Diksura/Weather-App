import 'package:flutter/material.dart';


class IconValueDescriptionTile extends StatelessWidget {
  const IconValueDescriptionTile({
    super.key,
    required this.icon,
    required this.measureType,
    this.measureTypePaddingRight,
    required this.value,
    required this.description, this.descriptionTextStyle,
  });

  final Widget icon;
  final String measureType;
  final String value;
  final String description;
  final double? measureTypePaddingRight;
  final TextStyle? descriptionTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(value, style: const TextStyle(fontSize: 48, color: Colors.black54)),

                  Padding(
                    padding: EdgeInsets.only(right: measureTypePaddingRight ?? 18.0),
                    child: Text(measureType, style: TextStyle(color: Colors.black54)),
                  ),
                ],
              ),

              Positioned(top: 0, right: 0, left: 80, child: icon),
            ],
          ),
        ),

        Text(description, style: descriptionTextStyle ?? TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    );
  }
}
