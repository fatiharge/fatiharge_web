import 'package:fatiharge/product/enum/gif_enum.dart';
import 'package:fatiharge/product/extension/string_extension.dart';

extension GifExtension on GifEnum {
  String get path {
    return 'assets/gif/${name.camelToSnakeCase}.gif';
  }
}
