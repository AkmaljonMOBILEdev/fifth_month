part of 'contact_cubit.dart';

class ContactState extends Equatable{
  final List<ContactModel> contactList;

  const ContactState({required this.contactList});

  @override
  List<Object?> get props => [contactList];
}

