class DoctorModel {
    DoctorModel({
        required this.id,
        this.name,
        this.address,
        this.image,
        this.description,
        this.startDate,
        this.ratingScore,
        this.ratingAmount,
        this.patientAmount,
        this.categoryId,
        this.createdAt,
        this.updatedAt,
    });

    final int id;
    String? name;
    String? address;
    String? image;
    String? description;
    DateTime? startDate;
    String? ratingScore;
    int? ratingAmount;
    int? patientAmount;
    int? categoryId;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        image: json["image"],
        description: json["description"],
        startDate: json["start_date"] == null? null: DateTime.parse(json["start_date"]),
        ratingScore: json["rating_score"],
        ratingAmount: json["rating_amount"],
        patientAmount: json["patient_amount"],
        categoryId: json["category_id"],
        createdAt: json["created_at"] == null? null: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null? null: DateTime.parse(json["updated_at"]),
    );
}
