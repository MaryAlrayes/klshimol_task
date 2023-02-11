import 'package:klshimol_task/data/models/subcategory_model.dart';
import 'package:klshimol_task/domain/entities/info_entity.dart';

class InfoModel extends InfoEntity {
  InfoModel({
    required super.name,
    required super.subcategories,
  });

  factory InfoModel.fromJson(Map<String, dynamic> map) {
    return InfoModel(
      name: map['Name'] as String,
      subcategories: List<SubcategoryModel>.from(
        (map['SubCategory'] as List<dynamic>).map<SubcategoryModel>(
          (x) => SubcategoryModel.fromJson(x),
        ),
      ),
    );
  }
}
