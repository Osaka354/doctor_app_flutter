class CategoryModel {
  final int id;
  String? title;
  String? image;
  String? lavel;
  DateTime? createdAt;
  DateTime? updatedAt;

  CategoryModel({
    required this.id,
    this.title,
    this.image,
    this.lavel,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      lavel: json['lavel'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at']),
    );
  }
}
