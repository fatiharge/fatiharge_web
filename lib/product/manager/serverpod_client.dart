import 'package:fatiharge/secret/secret.dart';
import 'package:fatiharge_client/fatiharge_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

late Client client;

Future<void> initializeServerpodClient() async {
  client = Client(Secret.apiUrl)
    ..connectivityMonitor = FlutterConnectivityMonitor();
}
