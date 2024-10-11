import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'media_size_state.dart';
part 'media_size_event.dart';

class MediaSizeBloc extends Bloc<MediaSizeEvent, MediaSizeState> {
  MediaSizeBloc() : super(MediaSizeState.small) {
    on<BuildExecuted>((event, emit) {
      final pageStatus = getPageStatus(event.width);
      if (state == pageStatus) return;
      emit(pageStatus);
    });
  }

  static MediaSizeState getPageStatus(double width) {
    const _doubleBoundary = 726;

    return width > _doubleBoundary ? MediaSizeState.big : MediaSizeState.small;
  }
}
