class TryModel {
  final String? status;
  final String? token;

  TryModel({
    this.status,
    this.token,
  });

  factory TryModel.fromJson(Map<String, dynamic> json) => TryModel(
    status: json["status"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "token": token,
  };
}