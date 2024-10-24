part of 'api_call_bloc.dart';


 class ApiCallState extends Equatable{


   final String message ;
   final List<ApiCallModel> apiCallList ;
   final ApiEnum status ;

   const ApiCallState({
     this.message = "",
     this.status= ApiEnum.loading,
     this.apiCallList = const <ApiCallModel>[]
 });

   ApiCallState copyWith ({
     String? message,
     ApiEnum?  status ,
      List<ApiCallModel>? apiCallList

 }){
    return ApiCallState(
      status: status ?? this.status,
          message: message ?? this.message,
      apiCallList: apiCallList ?? this.apiCallList
    ) ;
}




  @override
  List<Object?> get props => [message , status , apiCallList];

 }

