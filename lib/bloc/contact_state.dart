import 'package:diskuss_task/models/contact.dart';
import 'package:diskuss_task/bloc/contact_bloc.dart'; // Ensure this import path is correct

abstract class ContactListState {
  final List<Contact> contacts;

  ContactListState({required this.contacts});
}

class ContactListInitial extends ContactListState {
  ContactListInitial({required List<Contact> contacts})
      : super(contacts: contacts);
}

class ContactListUpdated extends ContactListState {
  ContactListUpdated({required List<Contact> contacts})
      : super(contacts: contacts);
}
