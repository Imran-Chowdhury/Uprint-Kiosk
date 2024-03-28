
import 'package:dartz/dartz.dart';
import "package:http/http.dart";

import 'package:uprint_kisok/core/network/rest_client.dart';

import 'authentication_data_source.dart';

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  AuthenticationDataSourceImpl({required this.restClient});

  final RestClient restClient;


  @override
  Future<Either<String,Response>> signUp(Map<String, dynamic> requestBody) async {
    return await RestClient().signUp(
       requestBody,
    
       {
        'Content-Type': 'application/json; charset=UTF-8',
      },);
  }
 @override
  Future<Either<String,Response>> login(Map<String, dynamic> requestBody) async {
    return await RestClient().login(
       requestBody,
    
       {
        'Content-Type': 'application/json; charset=UTF-8',
      },);
  }

  @override
   Future<Either<String,Response>> sendPasswordResetEmail(Map<String, dynamic> requestBody)async{
    return await RestClient().sendPasswordResetEmail(
      requestBody,
      {
        'Content-Type': 'application/json; charset=UTF-8',
      },);
   }
  

  @override
  Future<Either<String,Response>> resetPassword(Map<String, dynamic> requestBody) async {
    return await RestClient().resetPassword(
      requestBody,
      {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }



  @override
  Future<Response> googleLogin(Map<String, dynamic> requestBody) async {
    return await RestClient().googleLogin(
      requestBody,
      {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }





}
