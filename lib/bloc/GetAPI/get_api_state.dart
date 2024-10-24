import 'package:equatable/equatable.dart';

import '../../Model/GetApiModel.dart';
enum GetApiStatus { LOADING , SUCCESS , ERROR }


class GetApiStates extends Equatable {

  final List<GetApiModel> getList ;
  final GetApiStatus status ;
  final String message ;

  GetApiStates({
    this.getList = const <GetApiModel>[],
    this.status = GetApiStatus.LOADING,
    this.message = ""
});

  GetApiStates copyWith({
    GetApiStatus? status ,
    String? message ,
    List<GetApiModel>? getList


}){
    return GetApiStates(
    status: status ?? this.status ,
      message: message ?? this.message ,
        getList: getList ?? this.getList
    );
}


  @override
  List<Object?> get props => [status , getList , message];


}