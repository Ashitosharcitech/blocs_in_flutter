


import 'package:blocs_in_flutter/login/modell/login_req_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  // @override
  // List<Object?> get props => []; // Base class can be empty
}

class LoginReqEvent extends LoginEvent {
 LoginReqModel? loginReqModel;
 LoginReqEvent({required this.loginReqModel});

 
  @override
  List<Object?> get props => [loginReqModel];
}
