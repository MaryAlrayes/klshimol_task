import 'package:klshimol_task/domain/entities/details_entity.dart';

class DetailsModel extends DetailsEntity {
  DetailsModel(
      {required super.fieldType, required super.fieldName, super.contentList});
  factory DetailsModel.fromJson(Map<String, dynamic> map) {
    return DetailsModel(
      fieldType: map['FieldType'] as int,
      fieldName: map['FieldName'] as String,
      contentList: map['contentList'] != null
          ? (map['contentList'] as List<dynamic>)
              .map((e) => e['Name'] as String)
              .toList()
          : null,
    );
  }
}
