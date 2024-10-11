import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mouse_region_state.dart';

class MouseRegionCubit extends Cubit<MouseRegionState> {
  MouseRegionCubit({bool isWeb = false})
      : super(isWeb ? MouseRegionInitial() : MouseRegionOnEnter());

  void onEnter() {
    emit(MouseRegionOnEnter());
  }

  void onExit() {
    emit(MouseRegionInitial());
  }
}
