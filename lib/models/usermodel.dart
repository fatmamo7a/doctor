class UserModel {
  final String username;
  final String mobile;
  final String picturePath;
  final String email;

  const UserModel({
    required this.username,
    required this.email,
    required this.mobile,
    required this.picturePath,
  });
  factory UserModel.fromJson(Map<String, dynamic> Json) {
    return UserModel(
      username: Json['username'] as String,
      mobile: Json['mobile'] as String,
      picturePath: Json['picture_path'] as String,
      email: Json['email'] as String,
    );
  }
}
