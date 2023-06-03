class HeartBeatModel {
  final String? status;
  final String? classification;

  HeartBeatModel({
    this.status,
    this.classification,
  });

  factory HeartBeatModel.fromJson(Map<String, dynamic> json) => HeartBeatModel(
        status: json["status"],
        classification: json["classification"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "classification": classification,
      };
}
