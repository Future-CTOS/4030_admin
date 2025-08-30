import 'package:flutter/material.dart';

class CustomDataTable extends StatelessWidget {
  final List<Map<String, String>> data;

  const CustomDataTable({super.key, required this.data});

  Color _getStatusColor(String status) {
    switch (status) {
      case "تایید شده":
        return Colors.green.shade300;
      case "تکمیل شده":
        return Colors.blue.shade300;
      case "در انتظار":
        return Colors.amber.shade300;
      case "لغو شده":
        return Colors.red.shade300;
      default:
        return Colors.grey.shade300;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200, width: 1),
        color: Colors.white,
      ),
      child: Table(
        border: const TableBorder(
          horizontalInside: BorderSide(color: Colors.black12, width: 0.5),
        ),
        columnWidths: const {
          0: FlexColumnWidth(2.5), // تاریخ
          1: FlexColumnWidth(2),   // نام
          2: FlexColumnWidth(2),   // فعالیت
          3: FlexColumnWidth(2),   // موقعیت
        },
        children: [
          const TableRow(
            decoration: BoxDecoration(color: Color(0xfff5f5f5)),
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text("تاریخ ثبت‌نام", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text("نام", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text("فعالیت", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text("موقعیت", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),

          ...data.map((row) {
            return TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(row["date"] ?? "", textAlign: TextAlign.center),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(row["name"] ?? "", textAlign: TextAlign.center),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(row["activity"] ?? "", textAlign: TextAlign.center),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getStatusColor(row["status"] ?? ""),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      row["status"] ?? "",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
