class LoginModel {
  final String? status;
  final String? token;

  LoginModel({
    this.status,
    this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
      };
}
