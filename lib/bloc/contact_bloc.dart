import 'package:diskuss_task/bloc/contact_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diskuss_task/models/contact.dart';
import 'contact_event.dart';
import 'contact_state.dart';

class ContactListBloc extends Bloc<ContactListEvent, ContactListState> {
  ContactListBloc() : super(ContactListInitial(contacts: [])) {
    on<AddContact>(addContact);
    on<DeleteContact>(deleteContact);
    on<UpdateContact>(updateContact); // Register the handler for UpdateContact
  }

  // Add a new contact
  void addContact(AddContact event, Emitter<ContactListState> emit) {
    final updatedContacts = List<Contact>.from(state.contacts)
      ..add(event.contact);
    emit(ContactListUpdated(contacts: updatedContacts));
  }

  // Delete a contact
  void deleteContact(DeleteContact event, Emitter<ContactListState> emit) {
    final updatedContacts = List<Contact>.from(state.contacts)
      ..remove(event.contact);
    emit(ContactListUpdated(contacts: updatedContacts));
  }

  // Update an existing contact
  void updateContact(UpdateContact event, Emitter<ContactListState> emit) {
    final updatedContacts = state.contacts.map((contact) {
      if (contact.id == event.contact.id) {
        return event.contact; // Return the updated contact
      }
      return contact; // Return unchanged contacts
    }).toList();
    emit(ContactListUpdated(contacts: updatedContacts));
  }
}
