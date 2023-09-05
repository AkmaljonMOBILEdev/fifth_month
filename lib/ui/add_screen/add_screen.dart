import 'package:fifth_month/bloc/user/user_bloc.dart';
import 'package:fifth_month/data/models/status.dart';
import 'package:fifth_month/data/models/user_keys.dart';
import 'package:fifth_month/ui/add_screen/widgets/main_button.dart';
import 'package:fifth_month/ui/add_screen/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  String gender = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add a new user"),
      ),
      body: BlocConsumer<UserBloc, UserState>(
        builder: (context, state){
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            children: [
              UserTextField(
                hintText: "Firstname",
                onChanged: (v) {
                  context.read<UserBloc>().updateUserFields(keys: UserKeys.firstname, value: v);
                },
              ),
              UserTextField(
                hintText: "Lastname",
                onChanged: (v) {
                  context.read<UserBloc>().updateUserFields(keys: UserKeys.lastname, value: v);

                },
              ),
              UserTextField(
                hintText: "Age",
                isAge: true,
                onChanged: (v) {
                  context.read<UserBloc>().updateUserFields(keys: UserKeys.age, value: int.parse(v));

                },
              ),
              UserTextField(
                hintText: "Job",
                onChanged: (v) {
                  context.read<UserBloc>().updateUserFields(keys: UserKeys.job, value: v);

                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildRadio('Male', 'male'),
                  SizedBox(width: 20.w,),
                  buildRadio('Female', 'female'),
                ],
              ),

              MainButton(
                title: "Add",
                onTap: () {
                  // debugPrint("THE USER: ${state.currentUser.toString()}");
                  context.read<UserBloc>().add(AddUser(userModel: state.currentUser));
                },
              )
            ],
          );
        },
        listener: (context, state){
          if(state.status==FormStatus.success&&state.statusText=="User added!"){
            context.read<UserBloc>().add(GetUsers());
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  Widget buildRadio(String label, String value) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: gender,
          onChanged: (String? selectedValue) {
            setState(() {
              gender = selectedValue!;
            });
            BlocProvider.of<UserBloc>(context).updateUserFields(keys: UserKeys.gender, value: gender);
            debugPrint("GENDER: $gender");
          },
          activeColor: Colors.deepPurpleAccent,
        ),
        Text(label),
      ],
    );
  }
}
