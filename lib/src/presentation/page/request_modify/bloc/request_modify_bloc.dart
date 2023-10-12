import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'request_modify_event.dart';
part 'request_modify_state.dart';

class RequestModifyBloc extends Bloc<RequestModifyEvent, RequestModifyState> {
  RequestModifyBloc() : super(const RequestModifyState()) {
    on<RequestModifyEvent>((event, emit) {

    });
  }
}
