import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mentos_flutter/src/data/dto/request/post/post_list_request.dart';
import 'package:mentos_flutter/src/data/dto/response/post/post_response.dart';
import 'package:mentos_flutter/src/data/repository/network/network.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required PostRepository postRepository
  }): _postRepository = postRepository, super(const HomeState()) {
    on<HomeSelectCategory>(_onPressedCategory);
    on<HomeLoadPostListEvent>(_loadPostList);
  }

  final PostRepository _postRepository;

  Future<void> _loadPostList(
    HomeLoadPostListEvent event,
    Emitter<HomeState> emit
  ) async {
    final postList = await _postRepository.getPostList(PostListRequest());
    emit(state.copyWith(list: postList.result));
  }

  Future<void> _onPressedCategory(
    HomeSelectCategory event,
    Emitter<HomeState> emit
  ) async {

  }
}