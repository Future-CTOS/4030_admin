import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class IranPlate extends StatelessWidget {
  final String cityCode;
  final String letter;
  final String firstPart;
  final String secondPart;

  const IranPlate({
    super.key,
    required this.cityCode,
    required this.letter,
    required this.firstPart,
    required this.secondPart,
  });

  @override
  Widget build(BuildContext context) => Container(
    height: 65,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 1.5),
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.pngs.iranianFlag.path,
              width: 24,
              height: 16,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 4),
            Text(
              "ایران",
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Text(cityCode, style: const TextStyle(fontSize: 12)),
          ],
        ),
        const VerticalDivider(color: Colors.black, thickness: 1, width: 20),
        Row(
          children: [
            Text(
              secondPart,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 6),
            Text(
              letter,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 6),
            Text(
              firstPart,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    ),
  );
}
