part of 'mouse_region_cubit.dart';

@immutable
sealed class MouseRegionState {}

final class MouseRegionInitial extends MouseRegionState {}

final class MouseRegionOnEnter extends MouseRegionState {}
