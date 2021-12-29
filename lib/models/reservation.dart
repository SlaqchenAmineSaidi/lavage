class Reservation {
  String gender;
  String day;
  String time;

  Reservation({this.gender, this.day, this.time});

  Reservation.fromJson(Map<String, dynamic> json)
      : gender = json['gender'],
        day = json['day'],
        time = json['time'];
}
