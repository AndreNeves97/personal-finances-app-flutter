import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';

class ChartBarWidget extends StatelessWidget {
  final String label;
  final String value;
  final double percentage;

  const ChartBarWidget({
    Key? key,
    required this.label,
    required this.value,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        FittedBox(child: Text(value)),
        const SizedBox(height: 5),
        _Bar(percentage: percentage),
        const SizedBox(height: 5),
        Text(label),
      ]),
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({
    Key? key,
    required this.percentage,
  }) : super(key: key);

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 10,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppColors.greyPalette,
                width: 1,
              ),
            ),
          ),
          FractionallySizedBox(
            heightFactor: percentage,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
