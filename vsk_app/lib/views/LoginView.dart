import 'package:redux/redux.dart';
import 'package:vsk_app/actions/login_actions.dart';
import 'package:vsk_app/models/login_state.dart';

class LoginView{
  bool getCode;
  Function getVerifiedCode;

  bool acceptAgreement;
  Function accept;
  Function decline;

  LoginView({this.getCode, this.getVerifiedCode, this.acceptAgreement, this.accept, this.decline});

  factory LoginView.create(Store<LoginState> state) {
    return LoginView(
      getCode: state.state.getCode, 
      getVerifiedCode: ()=> state.dispatch(GetVerifiedCode()),
      acceptAgreement: state.state.acceptAgreement,
      accept: () => state.dispatch(AcceptAgreement()),
      decline: () => state.dispatch(DeclineAgreement())
    );
  }
}