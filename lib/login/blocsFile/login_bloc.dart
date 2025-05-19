import 'package:blocs_in_flutter/login/modell/login_resp_model.dart';
import 'package:blocs_in_flutter/login/repoo/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  


 LoginBloc():super(LoginInitialState()){
 on<LoginReqEvent>((event,emit)async{
  
  emit(LoginLoadingState());

  try {

       LoginRespModel loginRespModel = await LoginRepo().login(
        event.loginReqModel?.username??"",
        event.loginReqModel?.password??"");


        emit(LoginLoadedState(loginRespModel: loginRespModel));
  }catch(e){
   emit(LoginErrorState(errorMsg: e.toString()));
  }
 });
     

     
}
}