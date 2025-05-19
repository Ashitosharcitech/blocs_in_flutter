import 'package:blocs_in_flutter/login/blocsFile/login_bloc.dart';
import 'package:blocs_in_flutter/login/blocsFile/login_event.dart';
import 'package:blocs_in_flutter/login/blocsFile/login_state.dart';
import 'package:blocs_in_flutter/login/modell/login_req_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});


  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Login Page"),),),
      body: BlocBuilder<LoginBloc, LoginState>(
        
        builder: (BuildContext context, state) {  
          if (state is LoginInitialState){  
            return  Padding(
                padding: const EdgeInsets.all(16.0),
              child: Column(
                       children: [
                  TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      hintText: "user name"
                    ),
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: "password"
                        ),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(onPressed: (){
                
                        var bloc =  BlocProvider.of<LoginBloc>(context);
                        var req = LoginReqModel(username: userNameController.text, password: passwordController.text);
                        bloc.add(LoginReqEvent(loginReqModel: req));
                      }, child: Text("login"))
            ],
          ),
        );

                    }else if(state is LoginLoadingState){
                        return CircularProgressIndicator();
                    }else if (state is LoginLoadedState){
                        return Center(child: Text(state.loginRespModel?.email?? "", style: TextStyle(color: Colors.red),),);
                    }else if (state is LoginErrorState){
                      return Center (child: Text(state.errorMsg??"", style: TextStyle(color: Colors.red),),);
                    } else{
                      return Container();
                    }
      },
        
      ) ,
    );
  }
}