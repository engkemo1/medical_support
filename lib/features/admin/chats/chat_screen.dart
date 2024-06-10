import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:medical_support/view_model/cubit/admin_cubit/admin_cubit.dart';
import 'package:medical_support/view_model/cubit/admin_cubit/admin_state.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "الشكاوي والاقتراحات",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: BlocProvider<AdminCubit>(
          create: (BuildContext context) => AdminCubit()..getChats(),
          child: BlocConsumer<AdminCubit, AdminMainState>(
            builder: (context, cubit) {
              var chats = AdminCubit.get(context).listComplaintsModel;

              return ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(chats[index].name.toString(),style: TextStyle(color: Colors.blue),),
                        )),
                    title: Text(chats[index].email.toString()),
                    subtitle: Text(chats[index].message.toString()),
                    trailing: Text(chats[index].type.toString()),
                  );
                },
                itemCount: chats.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              );
            },
            listener: (BuildContext context, AdminMainState state) async {
              if (state is GetChatsLoadingState) {
                SmartDialog.showLoading();
                await Future.delayed(const Duration(seconds: 2));
                SmartDialog.dismiss();
              }
            },
          ),
        ),
      ),
    );
  }
}
