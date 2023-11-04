import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentos_flutter/src/config/config.dart';
import 'package:mentos_flutter/src/data/data_source/data_source.dart';
import 'package:mentos_flutter/src/presentation/page/app/bloc/app_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/launch/bloc/launch_bloc.dart';
import 'package:mentos_flutter/src/util/enum/mentos_enum.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({Key? key}) : super(key: key);

  static BlocProvider<LaunchBloc> show() {
    return BlocProvider(
      create: (context) => LaunchBloc(
          datasource: getIt.get<LocalKeyValueDataSource>()
      )
        ..add(const LaunchStartEvent())
      ,
      child: const LaunchPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LaunchBloc, LaunchState>(
        listener: (BuildContext context, state) {
          switch(state.loadingStatus) {
            case LoadingStatus.success:
              context.read<AppBloc>().add(const AppChangeStatus(appStaus: AppStatus.joined));
              break;
            case LoadingStatus.failure:
              context.read<AppBloc>().add(const AppChangeStatus(appStaus: AppStatus.unAuth));
              break;
            default:
              break;
          }
        },
        child: const _LaunchView()
    );
  }
}

class _LaunchView extends StatelessWidget {
  const _LaunchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/mentos.png', width: 100, height: 100,),
            const SizedBox(height: 32,)
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
