import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:klshimol_task/presentation/widgets/content_widget.dart';

import '../../core/network/check_internet.dart';
import '../../core/ui/widgets/error_widget.dart';
import '../../core/ui/widgets/loading_widget.dart';
import '../../core/ui/widgets/no_connection_widget.dart';
import '../../data/data%20sources/info_data_source.dart';
import '../../data/repositories/info_repo_impl.dart';
import '../../domain/use%20cases/fetch_info_use_case.dart';
import '../bloc/info_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _getInfoBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(title:const Text('Task'),),
          body: SafeArea(
            child: BlocBuilder<InfoBloc, InfoState>(
              builder: (context, state) {
                if (state is InfoLoadingState) {
                  return _buildLoadingBody();
                } else if (state is InfoOfflineState) {
                  return _buildOfflineBody(context);
                } else if (state is InfoErrorState) {
                  return _buildNetworkErrorBody(state, context);
                } else if (state is InfoFetchedState) {
                  return _buildSuccesfulBody(state);
                } else {
                  return Container();
                }

              },
            ),
          ),
        );
      }),
    );
  }

  InfoBloc _getInfoBloc() {
    return InfoBloc(
      fecthInfoUseCase: FecthInfoUseCase(
        infoRepo: InfoRepoImpl(
          infoDataSource: InfoDataSourceWithHttp(client: Client()),
          networkInfo: NetworkInfoImpl(
            internetConnectionChecker: InternetConnectionChecker(),
          ),
        ),
      ),
    )..add(FetchInfoEvent());
  }


  Widget _buildSuccesfulBody(InfoFetchedState state) {
    return  ContentWidget(info: state.info,);
  }

  NetworkErrorWidget _buildNetworkErrorBody(
      InfoErrorState state, BuildContext context) {
    return NetworkErrorWidget(
      message: state.message,
      onPressed: () => BlocProvider.of<InfoBloc>(context).add(
        FetchInfoEvent(),
      ),
    );
  }

  NoConnectionWidget _buildOfflineBody(BuildContext context) {
    return NoConnectionWidget(
         onPressed: () => BlocProvider.of<InfoBloc>(context).add(
        FetchInfoEvent(),
      ),
    );
  }

  LoadingWidget _buildLoadingBody() {
    return const LoadingWidget();
  }
}
