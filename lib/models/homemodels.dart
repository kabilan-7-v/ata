class Popularevents {
  final String date;
  final String eventname;
  final String location;
  final String img;
  final String time;

  Popularevents(
      {required this.date,
      required this.eventname,
      required this.location,
      required this.img,
      required this.time});

  factory Popularevents.fromJson(Map<String, dynamic> json) {
    return Popularevents(
        date: json["date"],
        eventname: json["name"],
        location: json["location"],
        img: json["images"][0],
        time: json['time']);
  }

  Map<String, dynamic> toJson() {
    return {
      "date": date,
      "name": eventname,
      "location": location,
      "images": img,
      'time': time
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
        name: json["name"],
        desc: json["desc"] ?? "",
        img: json["image"],
        date: json["createdAt"],
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
