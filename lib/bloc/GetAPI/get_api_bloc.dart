import 'package:bloc/bloc.dart';
import 'package:bstat_examples/Repository/GetApiRepo.dart';
import 'package:bstat_examples/bloc/GetAPI/get_api_event.dart';
import 'package:bstat_examples/bloc/GetAPI/get_api_state.dart';


class GetApiBloc extends Bloc<GetApiEvents, GetApiStates> {

  GetApiRepo getApiRepo = GetApiRepo();

  GetApiBloc() : super(GetApiStates()) {
    on<FetchApi>(fetchApi);
  }
  void fetchApi(GetApiEvents events , Emitter<GetApiStates> emit)async{
    await getApiRepo.getApiCall().then((value) {
      emit(state.copyWith(status: GetApiStatus.SUCCESS , message: "Success" , getList: value));
    },).onError((error, stackTrace) {
      emit(state.copyWith(message: "Error",status: GetApiStatus.ERROR));
    },);
  }
}
