import 'package:bstat_examples/Utils/emums.dart';
import 'package:bstat_examples/bloc/ApiCall/api_call_bloc.dart';
import 'package:bstat_examples/bloc/GetAPI/get_api_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Apicall extends StatefulWidget {
  const Apicall({super.key});

  @override
  State<Apicall> createState() => _ApicallState();
}


class _ApicallState extends State<Apicall> {


  @override
  void initState() {
    super.initState();
    context.read<ApiCallBloc>().add(ApiFetch());

  }

  @override
  Widget build(BuildContext context) {
    print('We All are');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Call"),
      ),
      body: BlocBuilder<ApiCallBloc , ApiCallState>(
        buildWhen: (previous, current) => current.apiCallList != previous.apiCallList,
        builder: (context, state) {
          print('I am bulid only');
           if(state.status == ApiEnum.loading){
            return const Center(
              child:
              CircularProgressIndicator(),
            );
          }
          if(state.status == ApiEnum.success){
           return ListView.builder(itemBuilder: (context, index) {
             return ListTile(
               title: Text(state.apiCallList[index].title.toString()),
               subtitle: Text(state.apiCallList[index].id.toString()),
               trailing: Text(state.apiCallList[index].albumId.toString()),
               leading: CircleAvatar(
                   maxRadius: 25,
                   child: Image.network(state.apiCallList[index].thumbnailUrl.toString(),errorBuilder:  (context, error, stackTrace) {
                   return  const Icon(Icons.person);
                   },)),

             );
           },shrinkWrap: true,itemCount: state.apiCallList.length,);

          }
          else{
            return Center(
              child: Text(state.message),
            );
          }
        },
          ),
    );
  }
}
