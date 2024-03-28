import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uprint_kisok/feature/authentication/root/domain/authentication_repository.dart';



final resetPasswordUseCaseProvider = Provider((ref){
  return ResetPasswordUseCase(repository: ref.read(authenticationRepositoryProvider));
});


class ResetPasswordUseCase {
  ResetPasswordUseCase({required this.repository});
 final  AuthenticationRepository repository;

 Future<Either<String,Map<String,dynamic>>> resetPassword(Map<String,dynamic> requestBody) async{
  return await repository.resetPassword(requestBody);
 }

}