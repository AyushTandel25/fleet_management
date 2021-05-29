import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {

  static String id="/SplashScreen";

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  String selectedDate;
  List months =
  ['January', 'February', 'March', 'April', 'May','June','July','August','September','October','November','December'];



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
                child: ScheduleBlock(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScheduleBlock extends StatelessWidget {
  const ScheduleBlock({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
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
                    "Week of 01/15/2020 - 01/21/2020",
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
        ],
      ),
    );
  }
}
