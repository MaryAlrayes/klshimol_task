// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class DetailsEntity extends Equatable {

  final int fieldType;
  final String fieldName;
  final List<String>? contentList;
  const DetailsEntity({
    required this.fieldType,
    required this.fieldName,
    this.contentList,
  });

  @override
  List<Object?> get props => [fieldType,fieldName,contentList];

  DetailsEntity copyWith({
    int? fieldType,
    String? fieldName,
    List<String>? contentList,
  }) {
    return DetailsEntity(
      fieldType: fieldType ?? this.fieldType,
      fieldName: fieldName ?? this.fieldName,
      contentList: contentList ?? this.contentList,
    );
  }




}
