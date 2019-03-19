import 'package:flutter/material.dart';
import 'package:vsk_app/containers/login/smart/get_code_container.dart';

class FirstLoginWidget extends StatelessWidget {
  final bool firstWidget;

  FirstLoginWidget(this.firstWidget);

  @override
  Widget build(BuildContext context) => AnimatedOpacity(
    duration: Duration(milliseconds: 300),
    opacity: firstWidget ? 0.0 : 1.0,
    child: Container(
      alignment: FractionalOffset.center,
      child: GetCodeContainer()
    ),
  );
}