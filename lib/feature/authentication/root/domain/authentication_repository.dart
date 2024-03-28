import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uprint_kisok/feature/authentication/root/data/data_source/authentication_data_source.dart';
import 'package:uprint_kisok/feature/authentication/root/data/repository/authentication_repository_impl.dart';




final authenticationRepositoryProvider = Provider(
  (ref) => AuthenticationRepositoryImpl(
    dataSource: ref.read(authenticationDataSourceProvider),
  ),
);




abstract class AuthenticationRepository {
  
  Future login(Map<String, dynamic> requestBody);

  Future signUp(Map<String, dynamic> requestBody);
  
  Future sendPasswordResetEmail(Map<String, dynamic> requestBody);

  Future resetPassword(Map<String, dynamic> requestBody,);

  Future googleLogin(Map<String, dynamic> requestBody);
 
}




