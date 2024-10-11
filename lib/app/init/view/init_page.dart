import 'package:auto_route/auto_route.dart';
import 'package:fatiharge/app/init/bloc/init_cubit.dart';
import 'package:fatiharge/app/init/view/init_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InitCubit()..start(),
      child: InitView(),
    );
  }
}
