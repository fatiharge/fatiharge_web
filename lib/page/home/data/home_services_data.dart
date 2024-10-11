import 'package:fatiharge/generated/locale_keys.g.dart';
import 'package:fatiharge/product/design/component/atoms/card/hoverable_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:uikit/utility/extension/context_extension.dart';

class HomeServicesData {
  static List<HoverableCardModel> homeData(BuildContext context) => [
        HoverableCardModel(
          titleKey: LocaleKeys.services_consulting_title,
          descriptionKey: LocaleKeys.services_consulting_description,
          color: context.colorScheme.secondaryContainer,
          onColor: context.colorScheme.onSecondaryContainer,
          iconData: Icons.business_center,
        ),
        HoverableCardModel(
          titleKey: LocaleKeys.services_mobile_app_development_title,
          descriptionKey:
              LocaleKeys.services_mobile_app_development_description,
          color: context.colorScheme.primaryContainer,
          onColor: context.colorScheme.onPrimaryContainer,
          iconData: Icons.phone_android,
        ),
        HoverableCardModel(
          titleKey: LocaleKeys.services_native_plugins_title,
          descriptionKey: LocaleKeys.services_native_plugins_description,
          color: context.colorScheme.tertiaryContainer,
          onColor: context.colorScheme.onTertiaryContainer,
          iconData: Icons.extension,
        ),
        HoverableCardModel(
          titleKey: LocaleKeys.services_web_development_title,
          descriptionKey: LocaleKeys.services_web_development_description,
          color: context.colorScheme.surfaceContainer,
          onColor: context.colorScheme.onSurface,
          iconData: Icons.web,
        ),
        HoverableCardModel(
          titleKey: LocaleKeys.services_ecommerce_solutions_title,
          descriptionKey: LocaleKeys.services_ecommerce_solutions_description,
          color: context.colorScheme.primary,
          onColor: context.colorScheme.onPrimary,
          iconData: Icons.shopping_cart,
        ),
      ];
}
