import "package:flutter/material.dart";
import 'package:flutter_app_node/screens/authentication/sign_in.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInScreen(onToggle: () {}),
    );
  }
}
