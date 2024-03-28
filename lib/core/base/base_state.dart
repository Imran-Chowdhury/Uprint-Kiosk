
abstract class BaseState{
  const BaseState();
}

class InitialState extends BaseState{
  const InitialState();
}

class LoadingState<T> extends BaseState{
 const  LoadingState({this.data});

  final T? data;
}

class SuccessState<T> extends BaseState {
  const SuccessState({this.data});

  final T? data;
}


class ErrorState extends BaseState {
  final String errorMessage;

  const ErrorState(this.errorMessage);
}

enum Status {
  initial,
  loading,
  success,
  error,
}

class BaseStateNew<T> {
  BaseStateNew({
    this.status,
    this.message,
    this.data,
  });

  BaseStateNew.initial()
      : status = Status.initial,
        message = null,
        data = null;

  final Status? status;
  final String? message;
  final T? data;

  BaseStateNew<T> copyWith({
    Status? status,
    String? message,
    T? data,
  }) {
    return BaseStateNew<T>(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}

