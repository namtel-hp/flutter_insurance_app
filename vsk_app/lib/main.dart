import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vsk_app/models/login_state.dart';
import './reducers/login_reducer.dart';
import './assets/color.dart';
import 'package:vsk_app/pages/login.dart';

void main() {
  runApp(MyApp());

  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
}

ThemeData builtTheme() { 
  ThemeData base = ThemeData();
  return base.copyWith(
    hintColor: vskGrey,
    primaryColor: vskBlue,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: vskGrey,
        fontSize: 13.0
      )
    )
  );
}

class MyApp extends StatelessWidget {
  final Store<LoginState> store = Store<LoginState>(
    loginReducer,
    initialState: LoginState.init(),    
  );
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: this.store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,        
        theme: builtTheme(),
        home: LoginPage(),
      )
    );
  }
}