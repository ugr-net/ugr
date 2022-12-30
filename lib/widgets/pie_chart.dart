import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../myColors.dart';

/// Icons by svgrepo.com (https://www.svgrepo.com/collection/job-and-professions-3/)
class PieChartSample3 extends StatefulWidget {
  const PieChartSample3({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChartSample3State();
}

class PieChartSample3State extends State {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      child: Transform.translate(
        offset: Offset(0, -50),
        child: PieChart(
          PieChartData(
              pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection.touchedSectionIndex;
                });
              }),
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 0,
              centerSpaceRadius: 0,
              sections: showingSections()),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: MyColor.fbColor,
            value: 40,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget: _Icon(Icon(
              Icons.facebook,
              color: MyColor.fbColor,
            )),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: MyColor.igColor,
            value: 30,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget:
                _Icon(Icon(FontAwesomeIcons.instagram, color: MyColor.igColor)),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: MyColor.ytColor,
            value: 16,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget:
                _Icon(Icon(FontAwesomeIcons.youtube, color: MyColor.ytColor)),
            badgePositionPercentageOffset: .98,
          );
        case 3:
          return PieChartSectionData(
            color: MyColor.twColor,
            value: 15,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget:
                _Icon(Icon(FontAwesomeIcons.twitter, color: MyColor.twColor)),
            badgePositionPercentageOffset: .98,
          );
        default:
          throw 'Oh no';
      }
    });
  }
}

class _Icon extends StatelessWidget {
  final Icon icon;

  _Icon(this.icon) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      child: icon,
    );
  }
}
