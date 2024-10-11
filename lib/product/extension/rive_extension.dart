import 'package:fatiharge/product/enum/rive_enum.dart';
import 'package:fatiharge/product/extension/string_extension.dart';

extension RiveExtension on RiveEnum {
  String get path {
    return 'assets/rive/${name.camelToSnakeCase}.riv';
  }

}
