import 'dart:convert';

import 'package:blocs_in_flutter/login/modell/login_req_model.dart';
import 'package:blocs_in_flutter/login/modell/login_resp_model.dart';
import 'package:http/http.dart' as http;


class LoginRepo{
 Future<LoginRespModel> login(String userName, String password)async{

    var url =  "https://dummyjson.com/auth/login";

    LoginReqModel loginReqModel = LoginReqModel(username: userName, password: password);
    http.Response response = await http.post(Uri.parse(url),
    headers: { 'Content-Type': 'application/json' },  
    body:jsonEncode(loginReqModel.toJson())
    
    );
  try {
    if (response.statusCode == 200){

        var resp = response.body;

        var respBody = jsonDecode(resp);
      return LoginRespModel.fromJson(respBody);
    }else{
      return LoginRespModel();
    }
  }catch(e){
    throw Exception(e);
  }

    
  }
}