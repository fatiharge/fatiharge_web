import 'package:flutter/material.dart';

class Spacer extends SizedBox {
  const Spacer({super.key, double? height}) : super(height: height ?? 8);

  const Spacer.vertical({super.key, double? width}) : super(width: width ?? 8);
}
