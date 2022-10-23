import 'cagetory_model.dart';
import 'doctor_model.dart';

class HomeModel {
  final List<CategoryModel> categories;
  final List<DoctorModel> doctors;

  HomeModel({
    this.categories = const [],
    this.doctors = const [],
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      categories: json['categories'] == null? []: List<CategoryModel>.from(
        json['categories'].map(
          (x) => CategoryModel.fromJson(x)
        ),
      ),
      doctors: json['doctors'] == null? []: List<DoctorModel>.from(
        json['doctors'].map(
          (x) => DoctorModel.fromJson(x)
        ),
      ),
    );
  }
}
