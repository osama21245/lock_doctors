// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lock_doctors/features/student/data/model/total_attendance_for_one_material_model.dart';

import '../../bloc/student_bloc.dart';

class _BarChart extends StatelessWidget {
  final List<TotalAttendanceForOneMaterialModel> barsData;
  const _BarChart({
    required this.barsData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (barsData.isEmpty) {
      return const SizedBox();
    }
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 33,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Color.fromARGB(220, 185, 124, 255),
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color.fromARGB(123, 195, 149, 248),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Sections';
        break;
      case 1:
        text = 'Lectures';
        break;
      case 2:
        text = 'Laps';
        break;

      default:
        return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => const LinearGradient(
        colors: [
          Color.fromARGB(255, 92, 0, 212),
          Color.fromARGB(120, 185, 124, 255),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              width: 20,
              toY: barsData[0].totalAttendForSections.toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              width: 20,
              toY: barsData[0].totalAttendForLectures.toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              width: 20,
              toY: barsData[0].totalAttendForLaps.toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}

class BarChartSample3 extends StatefulWidget {
  const BarChartSample3({super.key});

  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}

class BarChartSample3State extends State<BarChartSample3> {
  @override
  Widget build(BuildContext context) {
    List<TotalAttendanceForOneMaterialModel> totalAttendanceForOneMaterial = [];
    return BlocConsumer<StudentBloc, StudentState>(listener: (context, state) {
      if (state is StudentGetStudentTotalAttendTimeForOneMaterialSuccess) {
        totalAttendanceForOneMaterial = state.totalAttendanceForOneMaterial;
      } else if (state is StudentFailed) {
        totalAttendanceForOneMaterial.clear();
      }
    }, builder: (context, state) {
      if (state is StudentGetStudentTotalAttendTimeForOneMaterialSuccess) {
        return AspectRatio(
          aspectRatio: 1.6,
          child: _BarChart(barsData: state.totalAttendanceForOneMaterial),
        );
      }
      return AspectRatio(
        aspectRatio: 1.6,
        child: _BarChart(barsData: totalAttendanceForOneMaterial),
      );
    });
  }
}
