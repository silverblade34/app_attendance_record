// To parse this JSON data, do
//
//     final sectionsStudents = sectionsStudentsFromJson(jsonString);

import 'dart:convert';

List<SectionsStudents> sectionsStudentsFromJson(String str) => List<SectionsStudents>.from(json.decode(str).map((x) => SectionsStudents.fromJson(x)));

String sectionsStudentsToJson(List<SectionsStudents> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SectionsStudents {
    int id;
    String name;
    String schedule;
    List<Student> students;

    SectionsStudents({
        required this.id,
        required this.name,
        required this.schedule,
        required this.students,
    });

    factory SectionsStudents.fromJson(Map<String, dynamic> json) => SectionsStudents(
        id: json["id"],
        name: json["name"],
        schedule: json["schedule"],
        students: List<Student>.from(json["students"].map((x) => Student.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "schedule": schedule,
        "students": List<dynamic>.from(students.map((x) => x.toJson())),
    };
}

class Student {
    int id;
    String name;
    String lastname;

    Student({
        required this.id,
        required this.name,
        required this.lastname,
    });

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
    };
}
