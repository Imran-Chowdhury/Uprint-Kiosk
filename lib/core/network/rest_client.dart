import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:uprint_kisok/core/network/api.dart';

final restClientProvider = Provider((ref) => RestClient());



class RestClient{


Future<Either<String,Response>> signUp( Map<String, dynamic> data, Map<String,String> headers) async {


 String signUpUrl = API.signUpUrl;

 try{

  final response = await http.post(
      Uri.parse(signUpUrl),
      headers: headers,
      body: jsonEncode(data),
    ).then((value) => value);

    return Right(response);

 } catch(e){
  return Left(_getHttpException(e));

 }

}



Future<Either<String,Response>> login( Map<String, dynamic> data, Map<String,String> headers) async {


 String loginUrl = API.loginUrl;

 try{

  final response = await http.post(
      Uri.parse(loginUrl),
      headers: headers,
      body: jsonEncode(data),
    ).then((value) => value);

    return Right(response);

 } catch(e){
  return Left(_getHttpException(e));

 }

}



Future<Either<String,Response>> sendPasswordResetEmail( Map<String, dynamic> data, Map<String,String> headers) async {


 String sendEmailurl = API.sendPasswordResetEmailUrl;

 try{

  final response = await http.post(
      Uri.parse(sendEmailurl),
      headers: headers,
      body: jsonEncode(data),
    ).then((value) => value);

    return Right(response);

 } catch(e){
  return Left(_getHttpException(e));

 }

}



Future<Either<String,Response>> resetPassword( Map<String, dynamic> data, Map<String,String> headers) async {


 String resetPasswordUrl = API.resetPasswordUrl;

 try{

  final response = await http.post(
      Uri.parse(resetPasswordUrl),
      headers: headers,
      body: jsonEncode(data),
    ).then((value) => value);

    return Right(response);

 } catch(e){
  return Left(_getHttpException(e));

 }

}



Future<Response> googleLogin (Map<String, dynamic> data, Map<String,String> headers) async {


 String googleLoginUrl = API.googleLoginUrl;

 try{

  final response = await http.post(
      Uri.parse(googleLoginUrl),
      headers: headers,
      body: jsonEncode(data),
    ).then((value) => value);
    print(response.body);

    return response;

 } catch(e){

      rethrow;
   }

}





String _getHttpException(dynamic error) {
  if (error is http.ClientException) {
    return 'Something went wrong. Please try again';
  }  else if (error is FormatException) {
   return 'Something went wrong. Please try again.';
  }else if (error is http.Response) {
    if(error.statusCode ==400){
      return 'Error 400!! The server could not understand the request';
    }else if(error.statusCode ==401){
      return 'Error 401!! Authentication is required and has failed or has not yet been provided.';
    }else if(error.statusCode ==403){
      return ' Error 403!! The client does not have permission to access the requested resource.';
    }else if(error.statusCode ==404){
      return 'Error 404!! The server cannot find the requested resource.';
    }else if(error.statusCode ==500){
      return 'Error 500!! Internal server error has occured';
    }else if(error.statusCode ==503){
     return 'Error 503!! The server could not understand the request';
    }else{
      return 'Something went wrong. Please try again.';
    }
    
  } else {
    throw 'Unexpected error has occured';
  }
}
}








