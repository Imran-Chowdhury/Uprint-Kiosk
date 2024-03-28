// import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import 'package:uprint_kisok/core/network/rest_client.dart';

import 'authentication_data_source_impl.dart';

final authenticationDataSourceProvider = Provider(
  (ref) => AuthenticationDataSourceImpl(
    restClient: ref.read(restClientProvider),
  ),
);

abstract class AuthenticationDataSource {

  Future<Either<String,Response>> login(Map<String, dynamic> requestBody);

  Future<Either<String,Response>> signUp(Map<String, dynamic> requestBody);

  Future<Either<String,Response>> sendPasswordResetEmail(Map<String, dynamic> requestBody);

  Future<Either<String,Response>> resetPassword(Map<String, dynamic> requestBody);

  Future<Response> googleLogin(Map<String, dynamic> requestBody);


}
