

class MyDate {

  MyDate({
    required this.date,
    required this.title,
    this.memo,
  });

  DateTime date;
  String title;
  String? memo;

  // DateTime Object contains time. This getter returns a String which has only date (in the user's timezone)
  String get dateString => '${date.toLocal()}'.split(' ')[0];
  
}

