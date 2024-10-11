import 'package:auto_route/auto_route.dart';
import 'package:fatiharge/page/home/view/home_view.dart';
import 'package:fatiharge/product/bloc/media_size/media_size_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MediaSizeBloc>(
          create: (BuildContext context) => MediaSizeBloc(),
        ),
      ],
      child: HomeView(),
    );
  }
}
