/// ***
/// This class consists of the DateWidget that is used in the ListView.builder
///
/// Author: Vivek Kaushik <me@vivekkasuhik.com>
/// github: https://github.com/iamvivekkaushik/
/// ***

import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final Color circleBorderColor;
  final Color circleInnerColor;
  final bool bridgeEnableRight;
  final bool bridgeEnableLeft;
  final DateSelectionCallback? onDateSelected;
  final String? locale;

  final Color textColor;
  final Color bridgeColor;

  DateWidget({
    required this.circleBorderColor,
    required this.bridgeEnableLeft,
    required this.bridgeEnableRight,
    required this.circleInnerColor,
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    required this.textColor,
    this.width,
    this.onDateSelected,
    this.locale,
    required this.bridgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width,
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(39)),
          color: selectionColor,
        ),
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                date.day != 1
                    ? Text(
                        new DateFormat("E", locale)
                            .format(date)
                            .toUpperCase()
                            .substring(0, 1), // WeekDay
                        style: dayTextStyle)
                    : Text(
                        '${date.month}월',
                        style: monthTextStyle,
                      ),
                SizedBox(
                  height: 4,
                ),
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: -3,
                        child: Container(
                          width: width! + 6,
                          child: Row(
                            children: [
                              Expanded(
                                child: bridgeEnableLeft
                                    ? Container(
                                        height: 7,
                                        constraints: BoxConstraints(
                                            minWidth: double.infinity),
                                        color: bridgeColor,
                                      )
                                    : Container(),
                              ),
                              Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: circleBorderColor, width: 1.5),
                                    color: circleInnerColor),
                                child: Center(
                                  child: Text(date.day.toString(), // Date
                                      style: TextStyle(
                                          fontSize: 14, color: textColor)),
                                ),
                              ),
                              Expanded(
                                child: bridgeEnableRight
                                    ? Container(
                                        height: 7,
                                        constraints: BoxConstraints(
                                            minWidth: double.infinity),
                                        color: bridgeColor,
                                      )
                                    : Container(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
      onTap: () {
        // Check if onDateSelected is not null
        if (onDateSelected != null) {
          // Call the onDateSelected Function
          onDateSelected!(this.date);
        }
      },
    );
  }
}
