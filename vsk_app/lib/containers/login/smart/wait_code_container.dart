import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vsk_app/assets/color.dart';
import 'package:vsk_app/models/login_state.dart';
import 'package:vsk_app/views/LoginView.dart';

class WaitCodeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreConnector<LoginState, LoginView>(
    converter: (store) => LoginView.create(store),
    builder: (BuildContext context, LoginView loginView) => Column(
      children: <Widget>[
        SizedBox(height: 20.0,),
        TextField(
          decoration: InputDecoration(  
            prefixIcon: Icon(Icons.vpn_key, color: vskBlue,),          
            labelText: "Код", 
            contentPadding: EdgeInsets.all(13.0),                 
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),                    
            )
          ),
        ),
        SizedBox(height: 20.0,),
        Row(
          children: <Widget>[
            RaisedButton(
              child: Text(
                "Отправить повторно",
                style: TextStyle(
                  color: vskWhite
                ),
              ),
              color: vskBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              elevation: 8.0,
              onPressed: (){},
            ),
            SizedBox(width: 20.0,),
            RaisedButton(
              child: Text(
                "Принять код",
                style: TextStyle(
                  color: vskWhite
                ),
              ),
              color: vskBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              elevation: 8.0,
              onPressed: (){},
            )
          ],
        )
      ],
    ),
  );
}