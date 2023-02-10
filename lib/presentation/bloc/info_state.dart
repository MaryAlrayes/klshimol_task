part of 'info_bloc.dart';

abstract class InfoState extends Equatable {
  const InfoState();

  @override
  List<Object> get props => [];
}

class InfoInitial extends InfoState {}

class InfoLoadingState extends InfoState{}

class InfoFetchedState extends InfoState {

  final List<InfoEntity> info;
  const InfoFetchedState({
    required this.info,
  });
  @override
  List<Object> get props => [info];
}

class InfoOfflineState extends InfoState{}
class InfoErrorState extends InfoState {
  final String message;
  const InfoErrorState({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
