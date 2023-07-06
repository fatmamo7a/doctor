class UsersResponse {
  UsersResponse({
    required this.data,
  });

  final List<User> data;

  factory UsersResponse.fromJson(Map<String, dynamic> json) {
    return UsersResponse(
      data: json["data"] == null
          ? []
          : List<User>.from(json["data"]!.map((x) => User.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data.map((x) => x.toJson()).toList(),
      };
}

class User {
  User({
    required this.patientId,
    required this.patientName,
    required this.patientAge,
    required this.patientPhone,
    required this.classification,
    required this.description,
    required this.ownerid,
  });

  final String patientId;
  final String patientName;
  final String patientAge;
  final String patientPhone;
  final String classification;
  final String description;
  final String ownerid;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      patientId: json["patientId"] ?? "",
      patientName: json["patientName"] ?? "",
      patientAge: json["patientAge"] ?? "",
      patientPhone: json["patientPhone"] ?? "",
      classification: json["classification"] ?? "",
      description: json["description"] ?? "",
      ownerid: json["ownerid"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "patientId": patientId,
        "patientName": patientName,
        "patientAge": patientAge,
        "patientPhone": patientPhone,
        "classification": classification,
        "description": description,
        "ownerid": ownerid,
      };
}
