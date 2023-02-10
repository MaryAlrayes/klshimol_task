import 'package:dartz/dartz.dart';
import 'package:klshimol_task/core/errors/failures.dart';
import 'package:klshimol_task/domain/entities/info_entity.dart';

abstract class InfoRepo {
  Future<Either<Failure,List<InfoEntity>>> fetchInfo();
}
