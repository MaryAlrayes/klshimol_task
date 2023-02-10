// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:klshimol_task/domain/entities/details_entity.dart';

class SubcategoryEntity extends Equatable {
  final String name;
  final List<DetailsEntity> details;
  SubcategoryEntity({
    required this.name,
    required this.details,
  });

  @override
  List<Object?> get props => [name, details];




}
