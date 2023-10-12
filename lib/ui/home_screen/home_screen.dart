import 'package:fifth_month/cubits/contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Contacts"),
      ),
      body: BlocBuilder<ContactCubit, ContactState>(
        builder: (context, state) {
          return ReorderableListView.builder(
            onReorder: (oldIndex, newIndex) {
              context.read<ContactCubit>().reorderContact(oldIndex, newIndex);
            },
            itemCount: state.contactList.length,
            itemBuilder: (context, index) {
              return Dismissible(
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  context.read<ContactCubit>().removeContact(index);
                },
                background: Container(
                  color: Colors.red,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: null,
                        icon: Icon(Icons.delete, color: Colors.white,),
                      ),
                    ],
                  ),
                ),
                key: ValueKey(state.contactList[index]),
                child: ListTile(
                  key: ValueKey(state.contactList[index]),
                  title: Text(state.contactList[index].name),
                  subtitle: Text(state.contactList[index].phone),
                  trailing: const IconButton(onPressed: null, icon: Icon(Icons.menu)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
