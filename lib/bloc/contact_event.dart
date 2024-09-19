import 'package:diskuss_task/models/contact.dart';
import 'package:diskuss_task/bloc/contact_bloc.dart'; // Ensure this import path is correct

sealed class ContactListEvent {}

class AddContact extends ContactListEvent {
  final Contact contact;

  AddContact({required this.contact});
}

class DeleteContact extends ContactListEvent {
  final Contact contact;

  DeleteContact({required this.contact});
}

class UpdateContact extends ContactListEvent {
  final Contact contact;

  UpdateContact({required this.contact});
}
