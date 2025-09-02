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
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(row["Documents"] ?? "", textAlign: TextAlign.center),
                      ),
                      onTap: () {

                      },
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
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}
