class MurmurModel {
  final String? status;
  final String? classification;

  MurmurModel({
    this.status,
    this.classification,
  });

  factory MurmurModel.fromJson(Map<String, dynamic> json) => MurmurModel(
        status: json["status"],
        classification: json["classification"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "classification": classification,
      };
}
