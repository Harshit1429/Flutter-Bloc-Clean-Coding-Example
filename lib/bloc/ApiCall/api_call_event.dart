part of 'api_call_bloc.dart';

abstract class ApiCallEvent extends Equatable {

  const ApiCallEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ApiFetch extends ApiCallEvent {}
