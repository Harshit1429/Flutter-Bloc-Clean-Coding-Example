import 'package:bloc/bloc.dart';
import 'package:bstat_examples/Repository/ApiCallRepo.dart';
import 'package:bstat_examples/Utils/emums.dart';
import 'package:equatable/equatable.dart';

import '../../Model/ApiCallModel.dart';

part 'api_call_event.dart';
part 'api_call_state.dart';

class ApiCallBloc extends Bloc<ApiCallEvent, ApiCallState> {
  APiCallRepo aPiCallRepo = APiCallRepo();

  ApiCallBloc() : super( const ApiCallState()) {
    on<ApiFetch> (_Apicalled);
  }

  void _Apicalled (ApiCallEvent event , Emitter<ApiCallState> emit)async{
    await aPiCallRepo.apiList().then((value) {
      emit(state.copyWith(
        apiCallList: value,
        message: "Success",
        status: ApiEnum.success
      ));
    },).onError(
      (error, stackTrace) {
      emit(
        state.copyWith(
          status: ApiEnum.error,
          message: "error"
        )
      );
      },
    );
  }
}
