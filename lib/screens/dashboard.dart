import 'package:fleet_management/model/dataListModel.dart';
import 'package:fleet_management/components/schedule_block.dart';
import 'package:fleet_management/components/schedule_list.dart';
import 'package:fleet_management/components/schedule_time_block.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {

  static String id="/SplashScreen";

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  String selectedDate;
  List<String> months =
  ['January', 'February', 'March', 'April', 'May','June','July','August','September','October','November','December'];

  List<ScheduleWeekListModel> weekList=[];
  List<ScheduleBlock> blocks=[];

  List<Map<String,dynamic>> dataList=[
    {
      'start_week_date':'01/07/2020',
      'end_week_date':'01/13/2020',
      'schedule':{
        'MON':{
          '08':[
            {
              'label_text':'Server',
              'active':'0',
              'time_slot':'6:00 AM - 11:00 AM'
            },
            {
              'label_text':'Server',
              'active':'0',
              'time_slot':'11:00 AM - 03:00 PM'
            }
          ]
        },
        'WED':{
          '09':[
            {
              'label_text':'Server',
              'active':'0',
              'time_slot':'6:00 AM - 11:00 AM'
            },
            {
              'label_text':'Server',
              'active':'0',
              'time_slot':'11:00 AM - 03:00 PM'
            }
          ]
        },
        'FRI':{
          '11':[
            {
              'label_text':'DishWasher',
              'active':'1',
              'time_slot':'6:00 AM - 11:00 AM'
            },
          ],
        },
      },
    },
    {
      'start_week_date':'01/15/2020',
      'end_week_date':'01/21/2020',
      'schedule':{
        'MON':{
          '16':[
            {
              'label_text':'Server',
              'active':'0',
              'time_slot':'6:00 AM - 11:00 AM'
            },
            {
              'label_text':'Server',
              'active':'0',
              'time_slot':'11:00 AM - 03:00 PM'
            }
          ]
        },
        'WED':{
          '18':[
            {
              'label_text':'Server',
              'active':'0',
              'time_slot':'6:00 AM - 11:00 AM'
            },
            {
              'label_text':'Server',
              'active':'0',
              'time_slot':'11:00 AM - 03:00 PM'
            }
          ]
        },
        'FRI':{
          '19':[
            {
              'label_text':'DishWasher',
              'active':'1',
              'time_slot':'6:00 AM - 11:00 AM'
            },
          ],
        },
      },
    },
    {
      'start_week_date':'01/29/2020',
      'end_week_date':'02/04/2020',
      'schedule':{
        'MON':{
          '30':[
            {
              'label_text':'Server',
              'active':'0',
              'time_slot':'6:00 AM - 11:00 AM'
            },
            {
              'label_text':'Server',
              'active':'0',
              'time_slot':'11:00 AM - 03:00 PM'
            }
          ]
        },
        'WED':{
          '01':[
            {
              'label_text':'Server',
              'active':'0',
              'time_slot':'6:00 AM - 11:00 AM'
            },
            {
              'label_text':'Server',
              'active':'0',
              'time_slot':'11:00 AM - 03:00 PM'
            }
          ]
        },
        'FRI':{
          '03':[
            {
              'label_text':'DishWasher',
              'active':'1',
              'time_slot':'6:00 AM - 11:00 AM'
            },
          ],
        },
      },
    },
  ];

  @override
  void initState() {
    super.initState();
    getList();
  }

  void getList(){
    for(var data in dataList){
      weekList.add(
        ScheduleWeekListModel.fromJson(data),
      );
    }
    for(var week in weekList){
      List<ScheduleListBlock> listBlock=[];
      for (var day in week.scheduleDayListModel) {
        List<ScheduleTimeBlock> timeSlotList=[];
        for (var time in day.timeSlotListModel) {
          timeSlotList.add(ScheduleTimeBlock(
            labelText: time.labelText,
            status: time.status,
            timeSlot: time.timeSlot,
          ));
        }
        listBlock.add(
          ScheduleListBlock(
            day: day.day,
            weekDay: day.weekDay,
            timeSlotList: timeSlotList,
          ),
        );
      }
      blocks.add(ScheduleBlock(
        startDate: week.startDate,
        endDate: week.endDate,
        listBlock: listBlock,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.blue[700],
                          Colors.lightBlueAccent
                        ],
                      ),
                    ),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "My Schedule",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.calendar_today_rounded,color: Colors.white,),
                                  onPressed: () async{
                                    final DateTime picked= await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      initialDatePickerMode: DatePickerMode.day,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(3000),
                                    );
                                    print(picked);
                                    if(picked!=null){
                                      setState(() {
                                        selectedDate=months[picked.month-1]+" "+picked.year.toString();
                                        print(selectedDate);
                                      });
                                    }
                                  }
                              ),
                              Text(
                                selectedDate!=null && selectedDate!="" ? selectedDate : months[DateTime.now().month-1]+" "+DateTime.now().year.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26.0
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300]
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              elevation: 2.0,
              child: Container(
                height: MediaQuery.of(context).size.height/1.2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ListView(
                    children: blocks,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}