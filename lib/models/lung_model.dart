class LungModel {
  final String? status;
  final String? classification;

  LungModel({
    this.status,
    this.classification,
  });

  factory LungModel.fromJson(Map<String, dynamic> json) => LungModel(
        status: json["status"],
        classification: json["classification"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "classification": classification,
      };
}
