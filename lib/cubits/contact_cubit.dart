import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fifth_month/data/fake_data.dart';
import 'package:meta/meta.dart';

import '../data/models/contact_model.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactState(contactList: contacts));

  void reorderContact(int oldIndex, int newIndex){
    List<ContactModel> reorderedContacts = List.from(state.contactList);
    final ContactModel contactModel = reorderedContacts.removeAt(oldIndex);
    reorderedContacts.insert(newIndex, contactModel);
    emit(ContactState(contactList: reorderedContacts));
  }

  void removeContact(int index){
    List<ContactModel> updatedContacts = List.from(state.contactList);
    updatedContacts.removeAt(index);
    emit(ContactState(contactList: updatedContacts));
  }
}
