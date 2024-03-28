

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uprint_kisok/feature/authentication/root/domain/authentication_repository.dart';

final sendPasswordResetEmailUsecaseProvider = Provider((ref){
  return SendPasswordResetEmailUsecase(repository: ref.read(authenticationRepositoryProvider));
});


class SendPasswordResetEmailUsecase{
  SendPasswordResetEmailUsecase({required this.repository});
  
  AuthenticationRepository repository;

  Future<Either<String,Map<String,dynamic>>> sendPasswordResetEmail(Map<String,dynamic> requestBody)async{
    return await repository.sendPasswordResetEmail(requestBody);
  }

}