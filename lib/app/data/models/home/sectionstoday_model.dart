
import 'dart:convert';

SectionsToday sectionsTodayFromJson(String str) => SectionsToday.fromJson(json.decode(str));

String sectionsTodayToJson(SectionsToday data) => json.encode(data.toJson());

class SectionsToday {
    int id;
    String title;
    String schedule;
    int state;

    SectionsToday({
        required this.id,
        required this.title,
        required this.schedule,
        required this.state,
    });

    factory SectionsToday.fromJson(Map<String, dynamic> json) => SectionsToday(
        id: json["id"],
        title: json["title"],
        schedule: json["schedule"],
        state: json["state"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "schedule": schedule,
        "state": state,
    };
}
