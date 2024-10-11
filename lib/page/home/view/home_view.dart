import 'package:easy_localization/easy_localization.dart';
import 'package:fatiharge/generated/locale_keys.g.dart';
import 'package:fatiharge/page/appbar/main_appbar/view/main_appbar_view.dart';
import 'package:fatiharge/page/home/data/home_services_data.dart';
import 'package:fatiharge/page/home/view/contact_button.dart';
import 'package:fatiharge/product/bloc/media_size/media_size_bloc.dart';
import 'package:fatiharge/product/bloc/mouse_region/mouse_region_cubit.dart';
import 'package:fatiharge/product/design/component/atoms/badge/card_paper_badge.dart';
import 'package:fatiharge/product/design/component/atoms/card/hoverable_card_widget.dart';
import 'package:fatiharge/product/design/component/atoms/card/info_card.dart';
import 'package:fatiharge/product/design/component/atoms/layout/split_layout.dart';
import 'package:fatiharge/product/design/component/atoms/wrapper/adaptive_page_wrapper.dart';
import 'package:fatiharge/product/design/component/molecules/badge_align_wrapper.dart';
import 'package:fatiharge/product/enum/icon_enum.dart';
import 'package:fatiharge/product/enum/rive_enum.dart';
import 'package:fatiharge/product/extension/icon_extension.dart';
import 'package:fatiharge/product/extension/rive_extension.dart';
import 'package:fatiharge_client/fatiharge_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';
import 'package:uikit/utility/constant/padding/extension/padding_extension.dart';
import 'package:uikit/utility/extension/context_extension.dart';
import 'package:uikit/utility/extension/spacer_extension.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final _scrollController = ScrollController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<MediaSizeBloc>().add(BuildExecuted(context.width));
    return Scaffold(
      appBar: MainAppBar(
        onPressedContact: () => _animateTo(context, section: 3),
        onPressedOtherType: ({required type}) {
          switch (type) {
            case OtherType.mission:
              _animateTo(context);
            case OtherType.services:
              _animateTo(context, section: 2);
            // case OtherType.blog:
            //   _animateTo(context, section: );
          }
        },
      ),
      body: Builder(
        builder: (context) {
          return ListView(
            controller: _scrollController,
            // padding: context.pagePadding.medium.paddingSymmetricHorizontal,
            children: [
              AdaptivePageWrapper(child: mainBannerArea(context)),
              AdaptivePageWrapper(child: discoverArea(context)),
              AdaptivePageWrapper(
                isPadding: false,
                child: servicesArea(context),
              ),
              BlocBuilder<MediaSizeBloc, MediaSizeState>(
                builder: (context, state) {
                  return AdaptivePageWrapper(
                    flex: state == MediaSizeState.big ? 1 : 2,
                    child: contactArea(context, state),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Card contactArea(BuildContext context, MediaSizeState state) {
    return Card(
      // color: context.colorScheme.surface,
      child: SplitLayout(
        axis: state == MediaSizeState.big ? Axis.horizontal : Axis.vertical,
        firstChild: Padding(
          padding: state == MediaSizeState.big
              ? context.pagePadding.xLarge.paddingAll
              : context.pagePadding.medium.paddingAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    LocaleKeys.home_contact_us_title.tr(),
                    style: context.textTheme.headlineMedium,
                  ),
                  Text(
                    LocaleKeys.home_contact_us_text.tr(),
                  ),
                ],
              ),
              SizedBox(
                height: context.dynamicHeight(
                  state == MediaSizeState.big
                      ? context.heightScale.xLarge
                      : context.heightScale.xLarge,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InfoCard(
                      title: LocaleKeys.home_contact_write.tr(),
                      text: 'fatih@fatiharge.com',
                      iconData: Icons.mail,
                      boxColor: context.colorScheme.primary,
                      textColor: context.colorScheme.onPrimary,
                      isBigState: state == MediaSizeState.big,
                    ),
                    InfoCard(
                      title: LocaleKeys.home_contact_call.tr(),
                      text: '+90 534 922 14 87',
                      iconData: Icons.call,
                      boxColor: context.colorScheme.secondary,
                      textColor: context.colorScheme.onSecondary,
                      isBigState: state == MediaSizeState.big,
                    ),
                    InfoCard(
                      title: LocaleKeys.home_contact_location.tr(),
                      text: 'İstanbul, Türkiye',
                      iconData: Icons.location_on,
                      boxColor: context.colorScheme.tertiary,
                      textColor: context.colorScheme.onTertiary,
                      isBigState: state == MediaSizeState.big,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        secondChild: Padding(
          padding: state == MediaSizeState.big
              ? context.pagePadding.xLarge.paddingAll
              : context.pagePadding.medium.paddingAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                context.mediaBrightness == Brightness.dark
                    ? IconEnum.iconBlack.path
                    : IconEnum.iconWhite.path,
                fit: BoxFit.fitHeight,
                height: context.iconSize.xLarge,
              ),
              SizedBox(
                height: context.dynamicHeight(context.heightScale.xLarge),
                child: Card(
                  color: context.colorScheme.inversePrimary,
                  child: Padding(
                    padding: state == MediaSizeState.big
                        ? context.pagePadding.xLarge.paddingAll
                        : context.pagePadding.small.paddingAll,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: LocaleKeys.home_contact_name.tr(),
                          ),
                        ),
                        TextFormField(
                          controller: mailController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: LocaleKeys.home_contact_email.tr(),
                          ),
                        ),
                        TextFormField(
                          controller: messageController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: LocaleKeys.home_contact_message.tr(),
                          ),
                          minLines: 3,
                          maxLines: 3,
                        ),
                        ContactButton(
                          getContact: () {
                            return Contact(
                              name: nameController.text,
                              mail: mailController.text,
                              message: messageController.text,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column servicesArea(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: context.pagePadding.medium.paddingOnlyLeft,
          child: Text(
            LocaleKeys.app_bar_services.tr(),
            style: context.textTheme.headlineLarge,
          ),
        ),
        SizedBox(
          height: context.dynamicHeight(context.heightScale.xLarge),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              context.pagePadding.medium.spacerHorizontal,
              for (final data in HomeServicesData.homeData(context))
                Padding(
                  padding: context.itemPadding.xLarge.paddingOnlyRight,
                  child: SizedBox(
                    height: context.dynamicHeight(context.heightScale.xLarge),
                    width: context.dynamicHeight(context.heightScale.xLarge),
                    child: BlocProvider(
                      create: (context) => MouseRegionCubit(),
                      child: BlocBuilder<MouseRegionCubit, MouseRegionState>(
                        builder: (context, state) {
                          return HoverableCardWidget(
                            color: data.color,
                            onColor: data.onColor,
                            iconData: data.iconData,
                            state: state is MouseRegionOnEnter,
                            onEnter: context.read<MouseRegionCubit>().onEnter,
                            onExit: context.read<MouseRegionCubit>().onExit,
                            description: data.descriptionKey.tr(),
                            title: data.titleKey.tr(),
                          );
                        },
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget discoverArea(BuildContext context) {
    return BlocBuilder<MediaSizeBloc, MediaSizeState>(
      builder: (context, state) {
        return BadgeAlignWrapper(
          cardPaperBadge: state != MediaSizeState.big
              ? null
              : CardPaperBadge(
                  widget: IconButton(
                    onPressed: () => _animateTo(context, section: 2),
                    icon: const Icon(Icons.arrow_downward_outlined),
                  ),
                  cardHeight: context.cardSize.medium,
                  cardRadius: BorderRadius.circular(context.baseRadius.large),
                  cardColor: context.colorScheme.onPrimary,
                  backgroundColor: context.colorScheme.primary,
                  alignment: Alignment.bottomRight,
                ),
          child: Card(
            color: context.colorScheme.primary,
            child: BlocBuilder<MediaSizeBloc, MediaSizeState>(
              builder: (context, state) {
                return SplitLayout(
                  axis: state == MediaSizeState.big
                      ? Axis.horizontal
                      : Axis.vertical,
                  secondChild: Container(
                    alignment: Alignment.centerLeft,
                    margin: context.itemPadding.xLarge.paddingAll,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          LocaleKeys.home_discover_title.tr(),
                          style: (state == MediaSizeState.big
                                  ? context.textTheme.headlineLarge
                                  : context.textTheme.titleLarge)
                              ?.copyWith(
                            color: context.colorScheme.onPrimary,
                          ),
                        ),
                        context.itemPadding.xLarge.spacer,
                        Text(
                          LocaleKeys.home_discover_text.tr(),
                          style: (state == MediaSizeState.big
                                  ? context.textTheme.titleLarge
                                  : context.textTheme.labelMedium)
                              ?.copyWith(
                            color: context.colorScheme.onPrimary,
                          ),
                        ),
                        context.itemPadding.xLarge.spacer,
                      ],
                    ),
                  ),
                  firstChild: RiveAnimation.asset(
                    RiveEnum.robotArm.path,
                    fit: BoxFit.cover,
                    antialiasing: false,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget mainBannerArea(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(context.baseRadius.large),
      child: Card(
        child: Stack(
          children: [
            RiveAnimation.asset(
              RiveEnum.marsLandingPage.path,
              stateMachines: [RiveEnum.marsLandingPage.stateMachineName],
              fit: BoxFit.cover,
              antialiasing: false,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: BlocBuilder<MediaSizeBloc, MediaSizeState>(
                builder: (context, state) => Container(
                  margin: state == MediaSizeState.big
                      ? context.itemPadding.xLarge.paddingOnlyLeft
                      : null,
                  padding: context.itemPadding.medium.paddingAll,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.home_catchword.tr(),
                        style: (state == MediaSizeState.big
                                ? context.textTheme.headlineMedium
                                : context.textTheme.titleMedium)
                            ?.copyWith(color: Colors.white),
                      ),
                      context.itemPadding.xLarge.spacer,
                      SvgPicture.asset(
                        IconEnum.logoTextWhite.path,
                        fit: BoxFit.fitHeight,
                        height:
                            context.dynamicHeight(context.heightScale.medium),
                      ),
                      context.itemPadding.xLarge.spacer,
                      TextButton(
                        onPressed: () => _animateTo(context),
                        child: Text(
                          LocaleKeys.home_discover.tr(),
                          style: (state == MediaSizeState.big
                                  ? context.textTheme.headlineMedium
                                  : context.textTheme.titleMedium)
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _animateTo(BuildContext context, {int section = 1}) {
    _scrollController.animateTo(
      (context.mediaSize.height - 108) * section,
      duration: Duration(
        milliseconds: context.baseDuration.medium.toInt(),
      ),
      curve: Curves.easeInOut,
    );
  }
}
