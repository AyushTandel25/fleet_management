import 'package:fleet_management/components/schedule_list.dart';
import 'package:flutter/material.dart';

class ScheduleBlock extends StatelessWidget {

  final String startDate;
  final String endDate;
  final List<ScheduleListBlock> listBlock;

  const ScheduleBlock({Key key, this.startDate, this.endDate, this.listBlock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
            children: <Widget>[
              Expanded(
                child: Divider(
                  thickness: 2.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  "Week of $startDate - $endDate",
                  style: TextStyle(
                      color: Colors.blue[500],
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  thickness: 2.0,
                ),
              ),
            ]
        ),
        Column(
          children: listBlock,
        ),
      ],
    );
  }
}