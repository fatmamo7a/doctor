class Verificationmodel {
  String? status;
  String? message;

  Verificationmodel({this.status, this.message});

  Verificationmodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }


}
