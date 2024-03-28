// import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../root/domain/authentication_repository.dart';


final signUpUseCaseProvider = Provider(
  (ref) => SignUpUseCase(
    repository: ref.read(authenticationRepositoryProvider),
  ),
);

class SignUpUseCase {
  SignUpUseCase({required this.repository});

  final AuthenticationRepository repository;



   Future<Either<String,Map<String,dynamic>>> signUp(
    Map<String, dynamic> requestBody,
  ) async {
    return await repository.signUp(requestBody);
  }
 
}
