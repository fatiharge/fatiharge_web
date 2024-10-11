part of 'media_size_bloc.dart';


@immutable
sealed class MediaSizeEvent {}

final class BuildExecuted extends MediaSizeEvent {
  BuildExecuted(this.width);

  final double width;
}
