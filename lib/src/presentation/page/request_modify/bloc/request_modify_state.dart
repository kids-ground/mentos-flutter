part of 'request_modify_bloc.dart';

class RequestModifyState extends Equatable {
  RequestModifyState({
    this.title = '',
    this.content = '',
    this.tagList = const <String>[],
    this.selectedImageFileList = const <File>[],
    this.writeLoadingStatus = LoadingStatus.init,
    this.newPostId
  });

  final String title;
  final List<String> tagList;
  final String content;
  final List<File> selectedImageFileList;
  final LoadingStatus writeLoadingStatus;
  final int? newPostId;

  RequestModifyState copyWith({
    String? title,
    List<String>? tagList,
    String? content,
    List<File>? selectedImageFileList,
    LoadingStatus? writeLoadingStatus,
    int? newPostId
  }) => RequestModifyState(
    title: title ?? this.title,
    tagList: tagList ?? this.tagList,
    content: content ?? this.content,
    selectedImageFileList: selectedImageFileList ?? this.selectedImageFileList,
    writeLoadingStatus: writeLoadingStatus ?? this.writeLoadingStatus,
    newPostId: newPostId ?? this.newPostId
  );

  bool get canComplete => title.isNotEmpty && content.isNotEmpty;

  @override
  List<Object?> get props => [title, tagList, content, selectedImageFileList, writeLoadingStatus, newPostId];
}
