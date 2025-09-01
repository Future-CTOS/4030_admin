
import 'package:flutter/material.dart';

class CustomDriverManagementTable extends StatelessWidget {
  final List<Map<String, String>> data;

  const CustomDriverManagementTable({super.key, required this.data});

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
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // 🔥 اسکرول افقی
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical, // 🔥 اسکرول عمودی
          child: Table(
            border: const TableBorder(
              horizontalInside: BorderSide(color: Colors.black12, width: 0.5),
              verticalInside: BorderSide(color: Colors.black12, width: 0.5),
            ),
            defaultColumnWidth: const FixedColumnWidth(140),
            children: [
              // Header Row
 TableRow(
                decoration: BoxDecoration(color: Color(0xfff5f5f5)),
                children: [
                  _buildHeaderCell("تاریخ ثبت‌نام"),
                  _buildHeaderCell("نام"),
                  _buildHeaderCell("شماره موبایل"),
                  _buildHeaderCell("کد ملی"),
                  _buildHeaderCell("سفرها"),
                  _buildHeaderCell("مدارک"),
                  _buildHeaderCell("وضعیت"),
                ],
              ),

              // Data Rows
              ...data.map((row) {
                return TableRow(
                  children: [
                    _buildCell(row["date"] ?? ""),
                    _buildCell(row["name"] ?? ""),
                    _buildCell(row["phoneNumber"] ?? ""),
                    _buildCell(row["nationalCode"] ?? ""),
                    _buildCell(row["trips"] ?? ""),
                    _buildCell(row["Documents"] ?? ""),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
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
        ),
      ),
    );
  }

  static Widget _buildHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  static Widget _buildCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}

// Mock Data
final mockTableData = List.generate(50, (index) {
  return {
    "name": "کاربر شماره $index",
    "phoneNumber": "0901392$index",
    "nationalCode": "2280124$index",
    "date": "1403/08/${10 + (index % 20)}",
    "trips": "مشاهده",
    "Documents": "مشاهده",
    "status": index % 2 == 0 ? "تایید شده" : "در انتظار",
  };
});

/*
import 'package:flutter/material.dart';

class CustomDriverManagementTable extends StatelessWidget {
  final List<Map<String, String>> data;

  const CustomDriverManagementTable({super.key, required this.data});

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
          1: FlexColumnWidth(2), // نام
          2: FlexColumnWidth(2), // موبایل
          3: FlexColumnWidth(2), // کدملی
          4: FlexColumnWidth(2), // سفرها
          5: FlexColumnWidth(2), // مدارک
          6: FlexColumnWidth(2), // وضعیت
        },
        children: [
          // Header Row
          const TableRow(
            decoration: BoxDecoration(color: Color(0xfff5f5f5)),
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "تاریخ ثبت‌نام",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "نام",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "شماره موبایل",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "کد ملی",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "سفرها",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "مدارک",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "وضعیت",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          // Data Rows
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
                  child: Text(
                    row["phoneNumber"] ?? "",
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    row["nationalCode"] ?? "",
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    row["trips"] ?? "",
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    row["Documents"] ?? "",
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
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
*/
