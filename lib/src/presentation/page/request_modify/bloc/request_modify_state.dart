part of 'request_modify_bloc.dart';

class RequestModifyState extends Equatable {
  RequestModifyState({
    this.title = '',
    this.content = '',
    List<String>? tagList,
    List<File>? selectedImageFileList
  }): tagList = tagList ?? [], selectedImageFileList = selectedImageFileList ?? [];

  final String title;
  final List<String> tagList;
  final String content;
  final List<File> selectedImageFileList;

  RequestModifyState copyWith({
    String? title,
    List<String>? tagList,
    String? content,
    List<File>? selectedImageFileList,
  }) => RequestModifyState(
    title: title ?? this.title,
    tagList: tagList ?? this.tagList,
    content: content ?? this.content,
    selectedImageFileList: selectedImageFileList ?? this.selectedImageFileList
  );

  @override
  List<Object> get props => [title, tagList, content, selectedImageFileList];
}
