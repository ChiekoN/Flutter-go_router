

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

class MyDateProvider {
  static List<MyDate> samples = [
    MyDate(
      date: DateTime(2025, 7, 15),
      title: 'Emma\'s wedding',
      memo: 'At Crown Hall at 11:00am',
    ),
    MyDate(
      date: DateTime(2025, 10, 3),
      title: 'Holiday in Bangkok',
      memo: 'Return on 10/8',
    ),
    MyDate(
      date: DateTime(2025, 11, 7),
      title: 'My birthday',
      memo: 'No plan yet',
    ),
    MyDate(
      date: DateTime(2025, 12, 15),
      title: 'Christmas event',
      memo: 'No plan yet',
    ),
  ] ;
}