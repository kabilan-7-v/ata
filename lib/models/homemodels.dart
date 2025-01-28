class Popularevents {
  final String date;
  final String eventname;
  final String location;
  final String img;
  final String time;
  final String description;
  final String manageThrough;

  Popularevents(
      {required this.manageThrough,
      required this.description,
      required this.date,
      required this.eventname,
      required this.location,
      required this.img,
      required this.time});

  factory Popularevents.fromJson(Map<String, dynamic> json) {
    return Popularevents(
        description: json["description"] ?? "des",
        date: json["date"] ?? "date",
        eventname: json["name"] ?? "event",
        location: json["location"] ?? "location",
        img: json["images"][0] ?? "img",
        time: json['time'] ?? "time",
        manageThrough: json["this.manageThrough"] ?? "ManageThrough");
  }

  Map<String, dynamic> toJson() {
    return {
      "date": date,
      "name": eventname,
      "location": location,
      "images": img,
      'time': time,
      "description": description
    };
  }
}

class Latestpost {
  final String name;
  final String? desc;
  final String img;
  final String date;
  final String? location;

  Latestpost(
      {required this.name,
      required this.desc,
      required this.img,
      required this.date,
      required this.location});
  factory Latestpost.fromJson(Map<String, dynamic> json) {
    return Latestpost(
        name: json["name"] ?? "name",
        desc: json["desc"] ?? "des",
        img: json["image"] ?? "image",
        date: json["createdAt"] ?? "date",
        location: json["location"] ?? "location");
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "desc": desc ?? "",
      "images": img,
      "createdAt": date,
      "location": location ?? ""
    };
  }
}

class Sponsers {
  final String img;

  Sponsers({required this.img});
  factory Sponsers.fromJson(Map<String, dynamic> json) {
    return Sponsers(
      img: json["img"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "img": img,
    };
  }
}
