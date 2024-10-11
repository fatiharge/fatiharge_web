
extension StringExtension on String {
  String get camelToSnakeCase => replaceAllMapped(
    RegExp('[A-Z]'),
        (Match match) => '_${match.group(0)!.toLowerCase()}',
  );
}
