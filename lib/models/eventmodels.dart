class OnGoingEventmodels {
  final String date;
  final String eventname;
  final String? location;
  final String? description;
  final String image;
  bool? isselected;

  OnGoingEventmodels(
      {required this.date,
      required this.eventname,
      required this.location,
      required this.description,
      required this.image,
      required this.isselected});
  factory OnGoingEventmodels.fromJson(Map<String, dynamic> json) {
    return OnGoingEventmodels(
        date: json["createdAt"],
        eventname: json["name"],
        location: json["location"] ?? "location",
        description: json["desc"] ?? "description",
        image: json["image"],
        isselected: json["isselected"] ?? true);
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'name': eventname,
      'location': location ?? "location",
      'desc': description ?? "description",
      'images': image,
      'isselected': isselected ?? true
    };
  }
}

class UpcomingEventmodels {
  final String date;
  final String eventname;
  final String? location;
  final String? description;
  final String image;
  bool? isselected;

  UpcomingEventmodels({
    required this.date,
    required this.eventname,
    required this.location,
    required this.description,
    required this.image,
    required this.isselected,
  });

  factory UpcomingEventmodels.fromJson(Map<String, dynamic> json) {
    return UpcomingEventmodels(
        date: json["createdAt"],
        eventname: json["name"],
        location: json["location"] ?? "location",
        description: json["desc"] ?? "description",
        image: json["image"],
        isselected: json["isselected"] ?? true);
  }
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'name': eventname,
      'location': location ?? "location",
      'desc': description ?? "description",
      'images': image,
      'isselected': isselected ?? true
    };
  }
}
