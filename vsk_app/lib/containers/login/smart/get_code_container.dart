import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vsk_app/assets/color.dart';
import 'package:vsk_app/models/login_state.dart';
import 'package:vsk_app/views/LoginView.dart';

class GetCodeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreConnector<LoginState, LoginView>(    
    converter: (Store<LoginState> store) => LoginView.create(store),
    builder: (BuildContext context, LoginView viewLogin) => 
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                "Я даю согласие на обработку персональных данных",
                style: TextStyle(
                  color: vskGrey,
                  fontSize: 10.0
                )
              ),
              flex: 1,
            ),
            Expanded(
              child: Checkbox(
                value: viewLogin.acceptAgreement,
                onChanged: (_) => viewLogin.acceptAgreement ? viewLogin.decline() : viewLogin.accept()
              ),
              flex: 0,
            )
          ],
        ),
        RaisedButton(
          child: Text(
            "Выслать код",
            style: TextStyle(
              color: vskWhite
            ),
          ),
          color: vskBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          elevation: 8.0,
          onPressed: viewLogin.acceptAgreement ? viewLogin.getVerifiedCode : null,
        ),
      ],
    )
  );
}