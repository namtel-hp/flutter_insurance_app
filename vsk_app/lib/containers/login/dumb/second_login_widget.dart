import 'package:flutter/material.dart';
import 'package:vsk_app/containers/login/smart/wait_code_container.dart';

class SecondLoginWidget extends StatelessWidget {
  final bool secondWidget;

  SecondLoginWidget(this.secondWidget);

  @override
  Widget build(BuildContext context) => AnimatedOpacity(
    duration: Duration(milliseconds: 300),
    opacity: secondWidget ? 1.0 : 0.0,
    child: Container(
      alignment: FractionalOffset.center,
      child: WaitCodeContainer()
    ),
  );
}