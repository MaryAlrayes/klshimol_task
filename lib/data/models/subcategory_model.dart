import 'package:klshimol_task/data/models/details_model.dart';
import 'package:klshimol_task/domain/entities/subcategory_entity.dart';

class SubcategoryModel extends SubcategoryEntity {
  SubcategoryModel({required super.name, required super.details});
  factory SubcategoryModel.fromJson(Map<String, dynamic> map) {
    return SubcategoryModel(
      name: map['Name'] as String,
      details: List<DetailsModel>.from(
        (map['AllFields'] as List<dynamic>).map<DetailsModel>(
          (x) => DetailsModel.fromJson(x),
        ),
      ),
    );
  }
}
