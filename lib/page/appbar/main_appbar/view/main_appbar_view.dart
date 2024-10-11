import 'package:easy_localization/easy_localization.dart';
import 'package:fatiharge/generated/locale_keys.g.dart';
import 'package:fatiharge/product/bloc/media_size/media_size_bloc.dart';
import 'package:fatiharge/product/bloc/mouse_region/mouse_region_cubit.dart';
import 'package:fatiharge/product/design/component/atoms/button/hoverable_icon_button.dart';
import 'package:fatiharge/product/design/component/molecules/wavy_button_button.dart';
import 'package:fatiharge/product/enum/icon_enum.dart';
import 'package:fatiharge/product/extension/icon_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uikit/utility/constant/padding/extension/padding_extension.dart';
import 'package:uikit/utility/extension/context_extension.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, this.onPressedOtherType, this.onPressedContact});

  final void Function({required OtherType type})? onPressedOtherType;
  final void Function()? onPressedContact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.pagePadding.medium.paddingAll,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            context.mediaBrightness == Brightness.dark
                ? IconEnum.iconBlack.path
                : IconEnum.iconWhite.path,
            fit: BoxFit.fitHeight,
            height: context.iconSize.xLarge,
          ),
          BlocBuilder<MediaSizeBloc, MediaSizeState>(
            builder: (context, state) {
              if (state == MediaSizeState.big) {
                return Row(
                  children: [
                    for (final type in OtherType.values)
                      Padding(
                        padding: context.itemPadding.large.paddingOnlyRight,
                        child: BlocProvider(
                          create: (context) => MouseRegionCubit(),
                          child:
                              BlocBuilder<MouseRegionCubit, MouseRegionState>(
                            builder: (context, state) => WavyButton(
                              onEnter: context.read<MouseRegionCubit>().onEnter,
                              onExit: context.read<MouseRegionCubit>().onExit,
                              text: type.trKey.tr(),
                              state: state is MouseRegionOnEnter,
                              onPressed: () => _onPressedOtherType(type),
                            ),
                          ),
                        ),
                      ),
                    BlocProvider(
                      create: (context) => MouseRegionCubit(),
                      child: BlocBuilder<MouseRegionCubit, MouseRegionState>(
                        builder: (context, state) {
                          return HoverableIconButton(
                            onEnter: context.read<MouseRegionCubit>().onEnter,
                            onExit: context.read<MouseRegionCubit>().onExit,
                            text: LocaleKeys.general_contact_me.tr(),
                            secondText:
                                LocaleKeys.general_contact_me_upper.tr(),
                            iconData: Icons.arrow_forward,
                            secondIconData: Icons.circle,
                            color: context.colorScheme.onPrimary,
                            secondColor: context.colorScheme.primary,
                            onPressed: _onPressedContact,
                            state: state is MouseRegionOnEnter,
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return Row(
                  children: [
                    // IconButton.filledTonal(
                    //   onPressed: () {},
                    //   icon: const Icon(Icons.menu),
                    // ),
                    // context.itemPadding.medium.spacerHorizontal,
                    IconButton.filled(
                      onPressed: _onPressedContact,
                      icon: const Icon(Icons.edit_outlined),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void _onPressedContact() {
    if (onPressedContact != null) {
      onPressedContact!();
    } else {
      //GetIt.instance<RouteManager>().replaceNamed('/contact');
    }
  }

  void _onPressedOtherType(OtherType type) {
    if (onPressedOtherType != null) {
      onPressedOtherType!(type: type);
    } else {
      //GetIt.instance<RouteManager>().replaceNamed('/');
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(preferredSizeValue);

  double get preferredSizeValue => 108;
}

enum OtherType {
  mission(LocaleKeys.app_bar_mission),

  // blog(LocaleKeys.app_bar_blog),
  services(LocaleKeys.app_bar_services);

  const OtherType(this.trKey);

  final String trKey;
}
