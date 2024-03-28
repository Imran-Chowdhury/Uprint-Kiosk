









import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uprint_kisok/feature/authentication/root/domain/authentication_repository.dart';

final loginUseCaseProvider = Provider((ref){
  return LoginUseCase(
    repository: ref.read(authenticationRepositoryProvider));
});

class LoginUseCase {
  LoginUseCase({required this.repository});

  final AuthenticationRepository repository;

 Future<Either<String,Map<String,dynamic>>> login(Map<String, dynamic> requestBody, ) async {
    return await repository.login(requestBody);
  }
}


final googleloginUseCaseProvider = Provider((ref){
  return GoogleLoginUseCase(
    repository: ref.read(authenticationRepositoryProvider));
});

class GoogleLoginUseCase {
  GoogleLoginUseCase({required this.repository});

  final AuthenticationRepository repository;

 Future<Either<Map<String,dynamic>,Map<String,dynamic>>> googleLogin(Map<String, dynamic> requestBody, ) async {
    return await repository.googleLogin(requestBody);
  }
}
