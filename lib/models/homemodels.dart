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
  final String title;
  final String subtitle;
  final String img;

  Latestpost({required this.title, required this.subtitle, required this.img});
  factory Latestpost.fromJson(Map<String, dynamic> json) {
    return Latestpost(
      title: json["title"],
      subtitle: json["subtitle"],
      img: json["img"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "subtitle": subtitle,
      "img": img,
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
