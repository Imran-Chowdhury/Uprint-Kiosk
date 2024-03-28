
import 'dart:convert';

import 'package:dartz/dartz.dart';


import 'package:http/http.dart' as http; 
import 'package:uprint_kisok/feature/authentication/root/data/data_source/authentication_data_source.dart';

import 'package:uprint_kisok/feature/authentication/root/domain/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl({required this.dataSource});

  final AuthenticationDataSource dataSource;



  

  @override
  Future<Either<String, Map<String, dynamic>>> signUp(
  Map<String, dynamic> requestBody,
) async {
  try {
    final response = await dataSource.signUp(requestBody);

    return response.fold(
      (String error) => Left(error),
      (http.Response httpResponse) {
         Map<String, dynamic> responseBody = json.decode(httpResponse.body);
        if (httpResponse.statusCode == 201) {
          // Map<String, dynamic> responseBody = json.decode(httpResponse.body);
           String successMessage = responseBody['success']['message'];
          

           return Right({
              'status_code': httpResponse.statusCode,
              'message': successMessage,
            });
         
        } else {
           String errorMessage = responseBody['error']['message'];
       

          return Right({
            'status_code': httpResponse.statusCode,
            'message': errorMessage,
          });
        }
      },
    );
  } catch (e) {
    return Left(e.toString());
  }
}



    @override
  Future<Either<String, Map<String, dynamic>>> login(
  Map<String, dynamic> requestBody,
) async {
  try {
    final response = await dataSource.login(requestBody);

    return response.fold(
      (String error) => Left(error),
      (http.Response httpResponse) {
         Map<String, dynamic> responseBody = json.decode(httpResponse.body);
        if (httpResponse.statusCode == 200) {
          // Map<String, dynamic> responseBody = json.decode(httpResponse.body);
           String successMessage = responseBody['success']['message'];
          
          

           return Right({
              'status_code': httpResponse.statusCode,
              'message': successMessage,
               
            });
         
        } else {
           String errorMessage = responseBody['error']['message'];
       

          return Right({
            'status_code': httpResponse.statusCode,
            'message': errorMessage,
          });
        }
      },
    );
  } catch (e) {
    throw e.toString();
    // return Left(e.toString());
  }
}




  @override
  Future<Either<String, Map<String, dynamic>>> sendPasswordResetEmail(
  Map<String, dynamic> requestBody,
) async {
  try {
    final response = await dataSource.sendPasswordResetEmail(requestBody);

    return response.fold(
      (String error) => Left(error),
      (http.Response httpResponse) {
         Map<String, dynamic> responseBody = json.decode(httpResponse.body);
        if (httpResponse.statusCode == 200) {
          // Map<String, dynamic> responseBody = json.decode(httpResponse.body);
           String successMessage = responseBody['success']['message'];
          

           return Right({
              'status_code': httpResponse.statusCode,
              'message': successMessage,
            });
         
        } else {
           String errorMessage = responseBody['error']['message'];
       

          return Right({
            'status_code': httpResponse.statusCode,
            'message': errorMessage,
          });
        }
      },
    );
  } catch (e) {
    return Left(e.toString());
  }
}

@override
  Future<Either<String, Map<String, dynamic>>> resetPassword(
  Map<String, dynamic> requestBody,
) async {
  try {
    final response = await dataSource.resetPassword(requestBody);

    return response.fold(
      (String error) => Left(error),
      (http.Response httpResponse) {
         Map<String, dynamic> responseBody = json.decode(httpResponse.body);
        if (httpResponse.statusCode == 200) {
          // Map<String, dynamic> responseBody = json.decode(httpResponse.body);
           String successMessage = responseBody['success']['message'];
          

           return Right({
              'status_code': httpResponse.statusCode,
              'message': successMessage,
            });
         
        } else {
           String errorMessage = responseBody['error']['message'];
       

          return Right({
            'status_code': httpResponse.statusCode,
            'message': errorMessage,
          });
        }
      },
    );
  } catch (e) {
    return Left(e.toString());
  }
}




@override
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> googleLogin(
  Map<String, dynamic> requestBody,
) async {
  try {
    final response = await dataSource.googleLogin(requestBody);
    final resBody = json.decode(response.body);
    

    if(response.statusCode == 200){
      String successMessage = 'Login Successful';
      String userName = resBody['username'];


      Map<String, dynamic> successMap = {
        'User_name': userName,
        'status_code' : response.statusCode,
        'message': successMessage
      };


      return Right(successMap);


    }else{
      String errorMessage = resBody['error']['message'];

      Map<String, dynamic> errorMap = {
        'status_code' : response.statusCode,
        'message': errorMessage
      };

      return Left(errorMap);

    }
  } catch(e){
    rethrow;
  } 

 }
}