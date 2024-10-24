import 'package:bstat_examples/bloc/GetAPI/get_api_bloc.dart';
import 'package:bstat_examples/bloc/GetAPI/get_api_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/GetAPI/get_api_event.dart';

class Getapi extends StatefulWidget {
  const Getapi({super.key});

  @override
  State<Getapi> createState() => _GetapiState();
}

class _GetapiState extends State<Getapi> {

  @override
  void initState() {
    super.initState();
    context.read<GetApiBloc>().add(FetchApi());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Get Example'),
      ),
      body: BlocBuilder<GetApiBloc , GetApiStates>(builder: (context, state) {
        switch(state.status){
          case GetApiStatus.LOADING :
            return Center(
              child: CircularProgressIndicator(),
            );
          case GetApiStatus.SUCCESS:
            return ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.getList[index].name.toString()),
                subtitle: Text(state.getList[index].body.toString()),
                leading: Text(state.getList[index].id.toString()),
                trailing: Text(state.getList[index].postId.toString()),

              );
            },itemCount: state.getList.length,shrinkWrap: true,);
          case GetApiStatus.ERROR:
            return Center(
              child: Text(state.message.toString()),
            );
        }
      },),
    );
  }
}
