part of 'request_modify_bloc.dart';

abstract class RequestModifyEvent extends Equatable {
  const RequestModifyEvent();

  @override
  List<Object?> get props => [];
}

class RequestModifyTitle extends RequestModifyEvent {
  const RequestModifyTitle({
    required this.title
  });

  final String title;
}

class RequestModifyContent extends RequestModifyEvent {
  const RequestModifyContent({
    required this.content
  });

  final String content;
}

class RequestModifyTagList extends RequestModifyEvent {
  const RequestModifyTagList({
    required this.tagList
  });

  final List<String> tagList;
}

class RequestModifyPressedComplete extends RequestModifyEvent {
  const RequestModifyPressedComplete();
}

class RequestModifySelectImages extends RequestModifyEvent {
  const RequestModifySelectImages({
    required this.selectedImages
  });

  final List<File> selectedImages;
}
