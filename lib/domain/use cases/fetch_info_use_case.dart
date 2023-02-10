// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:klshimol_task/core/errors/failures.dart';
import 'package:klshimol_task/domain/entities/info_entity.dart';
import 'package:klshimol_task/domain/repositories/students_repo.dart';


class FecthInfoUseCase {
  final InfoRepo infoRepo;

  FecthInfoUseCase({
    required this.infoRepo
  });

  Future<Either<Failure,List<InfoEntity>>> call() async {

    return await infoRepo.fetchInfo();
  }
}
