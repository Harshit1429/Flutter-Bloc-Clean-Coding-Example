import 'package:equatable/equatable.dart';

abstract class GetApiEvents extends Equatable {

  const GetApiEvents();

  @override
  List<Object?> get props => [];

}

 class FetchApi extends GetApiEvents {}