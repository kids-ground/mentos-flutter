

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/mentor_detail/bloc/mentor_detail_bloc.dart';

class MentorDetailPage extends StatelessWidget {
  const MentorDetailPage({Key? key}) : super(key: key);

  static Route<void> route(int mentorId) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => MentorDetailBloc(),
        child: const MentorDetailPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
