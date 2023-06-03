class UserInfoModel {
  final String? status;
  final String? mobile;
  final String? picturePath;
  final String? username;
  final String? email;

  UserInfoModel({
    this.status,
    this.mobile,
    this.picturePath,
    this.username,
    this.email,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        status: json["status"],
        mobile: json["mobile"],
        picturePath: json["picture_path"],
        username: json["username"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "mobile": mobile,
        "picture_path": picturePath,
        "username": username,
        "email": email,
      };
}
