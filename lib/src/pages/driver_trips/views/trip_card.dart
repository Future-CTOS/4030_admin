import 'package:app_4030_admin/src/infrastructures/utils/spacing.dart';
import 'package:flutter/material.dart';

class TripCard extends StatelessWidget {
  const TripCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: AppSpacing.mediumPadding,
      margin: AppSpacing.mediumPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.onSurfaceVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // عنوان بالا
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // نوع تاکسی
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    // const Icon(Icons.local_taxi, color: Colors.amber, size: 22),
                    Text(
                      "تاکسی عادی",
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),

              const Text(
                "سفر پنج‌شنبه بعد از ظهر 2 مرداد",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ],
          ),

          AppSpacing.largeHorizontalSpacer,

          // مبدا
          Row(
            children: [
              Expanded(
                child: Text(
                  "مبدا: لورم ایپسوم متن ساختگی با تولید سادگی",
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.location_on, color: Colors.grey, size: 20),
            ],
          ),

          const SizedBox(height: 12),

          // مقصد
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  "مقصد: لورم ایپسوم متن ساختگی با تولید سادگی",
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.check_circle_outline,
                color: Colors.grey,
                size: 20,
              ),
            ],
          ),

          const SizedBox(height: 16),

          // وضعیت سفر
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "لغو شده توسط راننده",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
