import 'package:fatiharge/product/enum/video_enum.dart';
import 'package:fatiharge/product/extension/string_extension.dart';

extension VideoExtension on VideoEnum {
  String get path {
    return 'assets/video/${name.camelToSnakeCase}.mp4';
  }

}
