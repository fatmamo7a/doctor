class passwordModel {
  final String? status;
  final String? token;

  passwordModel({
    this.status,
    this.token,
  });

  factory passwordModel.fromJson(Map<String, dynamic> json) => passwordModel(
        status: json["status"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
      };
}
