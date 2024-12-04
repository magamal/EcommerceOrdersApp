import 'package:app/src/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatisticsItemWidget extends StatelessWidget {
  final String title;
  final String value;
  final String assetName;

  const StatisticsItemWidget({
    required this.title,
    required this.value,
    required this.assetName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grey,
            ),
            padding: const EdgeInsets.all(8),
            child: Center(
              child: SvgPicture.asset(
                assetName,
                alignment: Alignment.center,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: const TextStyle(
                color: AppColors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
                color: AppColors.black,
                fontSize: 19,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
