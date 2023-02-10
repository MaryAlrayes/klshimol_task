// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:klshimol_task/domain/entities/details_entity.dart';
import 'package:klshimol_task/domain/entities/subcategory_entity.dart';

class InfoEntity extends Equatable {
final String name;
final List<SubcategoryEntity> subcategories;
  const InfoEntity({
    required this.name,
    required this.subcategories,
  });

  @override

  List<Object?> get props => [name,subcategories];

}
