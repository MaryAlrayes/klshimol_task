// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:klshimol_task/core/errors/exceptions.dart';
import 'package:klshimol_task/core/errors/failures.dart';
import 'package:klshimol_task/core/network/check_internet.dart';
import 'package:klshimol_task/data/data%20sources/info_data_source.dart';
import 'package:klshimol_task/domain/entities/info_entity.dart';
import 'package:klshimol_task/domain/repositories/students_repo.dart';

class InfoRepoImpl implements InfoRepo {
  final InfoDataSource infoDataSource;
  final NetworkInfo networkInfo;
  InfoRepoImpl({
    required this.infoDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<InfoEntity>>> fetchInfo() async {
    if (await networkInfo.isConnected) {
      try {
        final returnedInfo = await infoDataSource.fetchInfo();
        return returnedInfo.fold((l) => Left(OfflineFailure()), (r) {
          List<InfoEntity> info = [];
          for (var element in r) {
            info.add(
              InfoEntity(
                  name: element.name, subcategories: element.subcategories),
            );
          }
          return Right(info);
        });
      } on ExceptionTimeout {
        return Left(NetworkErrorFailure(message: 'Time out'));
      } on ExceptionSocket {
        return Left(NetworkErrorFailure(message: 'Socket Error'));
      } on ExceptionFormat {
        return Left(NetworkErrorFailure(message: 'Bad Response Format'));
      } on ExceptionHandshake {
        return Left(NetworkErrorFailure(message: 'Handshake Error'));
      } on ExceptionOther {
        return Left(NetworkErrorFailure(message: 'Error'));
      } on CustomException catch (e) {
        return Left(NetworkErrorFailure(message: e.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
