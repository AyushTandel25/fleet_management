class ScheduleWeekListModel{
  String startDate;
  String endDate;
  List<ScheduleDayListModel> scheduleDayListModel;

  ScheduleWeekListModel({this.scheduleDayListModel,this.startDate,this.endDate});

  factory ScheduleWeekListModel.fromJson(Map<String,dynamic> json){
    List<ScheduleDayListModel> dayListModel=[];
    for(var schedule in json['schedule'].keys){
      for(var days in json['schedule'][schedule].keys){
        List<ScheduleTimeSlotListModel> timeSlotList=[];
        for(var timeSlots in json['schedule'][schedule][days]){
          timeSlotList.add(
            ScheduleTimeSlotListModel.fromJson(timeSlots),
          );
        }
        dayListModel.add(
          ScheduleDayListModel(
            weekDay: schedule,
            day: days,
            timeSlotListModel: timeSlotList,
          ),
        );
      }
    }
    return ScheduleWeekListModel(
      startDate: json['start_week_date'],
      endDate: json['end_week_date'],
      scheduleDayListModel: dayListModel,
    );
  }
}

class ScheduleDayListModel{

  String weekDay;
  String day;
  List<ScheduleTimeSlotListModel> timeSlotListModel;

  ScheduleDayListModel({this.day,this.weekDay,this.timeSlotListModel});

}

class ScheduleTimeSlotListModel{

  String status;
  String labelText;
  String timeSlot;

  ScheduleTimeSlotListModel({this.labelText,this.status,this.timeSlot});

  factory ScheduleTimeSlotListModel.fromJson(Map<String,dynamic> json){
    return ScheduleTimeSlotListModel(
      labelText:json['label_text'],
      status: json['active'],
      timeSlot: json['time_slot'],
    );
  }
}