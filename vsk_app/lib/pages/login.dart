import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vsk_app/assets/color.dart';
import 'package:vsk_app/assets/text_style.dart';
import 'package:vsk_app/containers/login/dumb/first_login_widget.dart';
import 'package:vsk_app/containers/login/dumb/second_login_widget.dart';
import 'package:vsk_app/models/login_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vsk_app/views/LoginView.dart';

const double generalPadding = 40.0;
const double roundRadius = 10.0;

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreConnector<LoginState, LoginView>(
    converter: (Store<LoginState> state) => LoginView.create(state),
    builder: (BuildContext context, LoginView viewLogin) => Scaffold(
      backgroundColor: vskBlue,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: generalPadding, bottom: generalPadding),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(generalPadding)),
                color: vskWhite
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: generalPadding + 25.0, right: generalPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "ВСК", 
                  style: TextStyle(
                    color: vskBlue,
                    fontSize: 50.0,
                    fontWeight: vskHeaderText
                  ),
                ),
                Text(
                  "страховой дом", 
                  style:TextStyle(
                    color: vskGrey,
                    fontSize: 20.0
                  )
                ),
                SizedBox(height: 100.0,),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone, color: vskBlue, size: 20.0,),
                    labelText: "Телефон",
                    contentPadding: EdgeInsets.all(0.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(roundRadius)
                    )
                  ),
                ),
                Container(
                  child: Stack(
                    children: <Widget>[
                      Offstage(
                        offstage: viewLogin.getCode == true,
                        child: FirstLoginWidget(viewLogin.getCode)
                      ),
                      Offstage(
                        offstage: viewLogin.getCode == false,
                        child: SecondLoginWidget(viewLogin.getCode),
                      )
                    ],
                  )
                )
              ],
            ),
          )
        ],
      )
    )
  );
}
