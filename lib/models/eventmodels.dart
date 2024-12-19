class OnGoingEventmodels {
  final String date;
  final String time;
  final String eventname;
  final String location;
  final String description;
  final String image;
  bool isselected;

  OnGoingEventmodels(
      {required this.date,
      required this.time,
      required this.eventname,
      required this.location,
      required this.description,
      required this.image,
      required this.isselected});
  factory OnGoingEventmodels.fromJson(Map<String, dynamic> json) {
    return OnGoingEventmodels(
        date: json["date"],
        time: json["time"],
        eventname: json["eventname"],
        location: json["location"],
        description: json["description"],
        image: json["image"],
        isselected: json["isselected"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'time': time,
      'eventname': eventname,
      'location': location,
      'description': description,
      'image': image,
    };
  }
}

class UpcomingEventmodels {
  final String date;
  final String time;
  final String eventname;
  final String location;
  final String description;
  final String image;
  bool isselected;

  UpcomingEventmodels({
    required this.date,
    required this.time,
    required this.eventname,
    required this.location,
    required this.description,
    required this.image,
    required this.isselected,
  });

  factory UpcomingEventmodels.fromJson(Map<String, dynamic> json) {
    return UpcomingEventmodels(
      isselected: json["isselected"],
      date: json["date"],
      time: json["time"],
      eventname: json["eventname"],
      location: json["location"],
      description: json["description"],
      image: json["image"],
    );
  }
}
