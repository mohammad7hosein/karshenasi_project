class ScheduleProvider {
  String? selectedCourse;
  String? selectedDay1;
  String? selectedDay2;
  String? selectedClock1;
  String? selectedClock2;
  bool isEven = false;

  List<String> courseList = [
    "درس شماره 1",
    "درس شماره 2",
    "درس شماره 3",
    "درس شماره 4",
    "درس شماره 5",
    "درس شماره 6",
    "درس شماره 7",
    "درس شماره 8",
    "درس شماره 9",
    "درس شماره 10",
  ];

  List<String> dayList = [
    "شنبه",
    "یکشنبه",
    "دوشنبه",
    "سه شنبه",
    "چهارشنبه",
  ];

  List<String> clockList = [
    "8_10",
    "10_12",
    "13:30_15:30",
    "15:30_17:30",
  ];
}
