import 'package:vsk_app/actions/login_actions.dart';
import 'package:redux/redux.dart';
import 'package:vsk_app/models/login_state.dart';

bool _getVerifiedCode(bool state, GetVerifiedCode code) => state = true;

bool _acceptAgreement(bool state, AcceptAgreement accept) => state = true;
bool _declineAgreement(bool state, DeclineAgreement accept) => state = false;


final Reducer<bool> codeReducer = combineReducers([
  TypedReducer<bool, GetVerifiedCode>(_getVerifiedCode)
]);

final Reducer<bool> agreementReducer = combineReducers([
  TypedReducer<bool, AcceptAgreement>(_acceptAgreement),
  TypedReducer<bool, DeclineAgreement>(_declineAgreement)
]);

LoginState loginReducer(LoginState state, action) => LoginState(
  codeReducer(state.getCode, action),
  agreementReducer(state.acceptAgreement, action)
);