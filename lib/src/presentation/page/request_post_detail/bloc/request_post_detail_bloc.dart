import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'request_post_detail_event.dart';
part 'request_post_detail_state.dart';

class RequestPostDetailBloc extends Bloc<RequestPostDetailEvent, RequestPostDetailState> {
  RequestPostDetailBloc() : super(const RequestPostDetailState()) {
    on<RequestPostDetailEvent>((event, emit) {
    });
  }
}
