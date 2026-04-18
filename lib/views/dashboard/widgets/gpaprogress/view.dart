import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GPAProgress extends StatelessWidget {
  const GPAProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.trending_up,
              color: Color(0xff1564BF),
            ),
            const SizedBox(width: 2),
            Text(
              "تقدم المعدل",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        Container(
          width: 380.w,
          height: 300.h,
          padding: EdgeInsets.only(
            top: 38.h,
            bottom: 18.h,
            left: 16.w,
            right: 16.w,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFE3E4E8),
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          //
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 4.5,
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),

              titlesData: FlTitlesData(
                topTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 35,
                    getTitlesWidget: (value, meta) {
                      final grades = ['3.6', '3.7', '3.9', '3.8'];

                      return Text(
                        grades[value.toInt()],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      );
                    },
                  ),
                ),

                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),

                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),

                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 35,
                    getTitlesWidget: (value, meta) {
                      final semesters = [
                        'خريف 22',
                        'ربيع 23',
                        'خريف 23',
                        'ربيع 24',
                      ];

                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          semesters[value.toInt()],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: value.toInt() == 3
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              barGroups: [
                _buildBar(0, 3.6),
                _buildBar(1, 3.7),
                _buildBar(2, 3.9),
                _buildBar(3, 3.8),
              ],
            ),
          ),
        ),
      ],
    );
  }

  BarChartGroupData _buildBar(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 34.w,
          borderRadius: BorderRadius.circular(14.r),
          color: const Color(0xFF2F63BF),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 4.2,
            color: const Color(0xFFE9D6D9),
          ),
        ),
      ],
    );
  }
}