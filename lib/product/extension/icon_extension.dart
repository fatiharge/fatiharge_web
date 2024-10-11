import 'package:fatiharge/product/enum/icon_enum.dart';
import 'package:fatiharge/product/extension/string_extension.dart';

extension IconExtension on IconEnum {
  String get path {
    return 'assets/svg/${name.camelToSnakeCase}.svg';
  }

}
