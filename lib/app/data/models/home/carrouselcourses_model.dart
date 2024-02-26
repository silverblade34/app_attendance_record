import 'dart:convert';

CarrouselCourse carrouselCourseFromJson(String str) => CarrouselCourse.fromJson(json.decode(str));

String carrouselCourseToJson(CarrouselCourse data) => json.encode(data.toJson());

class CarrouselCourse {
    String name;
    String image;

    CarrouselCourse({
        required this.name,
        required this.image,
    });

    factory CarrouselCourse.fromJson(Map<String, dynamic> json) => CarrouselCourse(
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
    };
}
