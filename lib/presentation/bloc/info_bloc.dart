import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:klshimol_task/core/errors/failures.dart';
import 'package:klshimol_task/domain/entities/info_entity.dart';
import 'package:klshimol_task/domain/use%20cases/fetch_info_use_case.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  final FecthInfoUseCase fecthInfoUseCase;
  InfoBloc({required this.fecthInfoUseCase}) : super(InfoInitial()) {
    on<InfoEvent>((event, emit)async {
      emit(InfoLoadingState());
      final result = await fecthInfoUseCase();
      result.fold(
        (failure) {
          _mapFailureToState(emit, failure);
        },
        (info) => emit(
        InfoFetchedState(info: info),
        ),
      );
    });
  }

  _mapFailureToState(emit, Failure f) {
    switch (f.runtimeType) {
      case OfflineFailure:
        emit(InfoOfflineState());
        break;

      case NetworkErrorFailure:
        emit(InfoErrorState(
          message: (f as NetworkErrorFailure).message,
        ));
        break;

      default:
        emit(const InfoErrorState(
          message: 'Error',
        ));
        break;
    }
  }
}
