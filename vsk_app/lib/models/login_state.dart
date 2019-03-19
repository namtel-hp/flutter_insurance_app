class LoginState{
  bool getCode;
  bool acceptAgreement;

  LoginState(this.getCode, this.acceptAgreement);

  factory LoginState.init() => LoginState(false, false);
}