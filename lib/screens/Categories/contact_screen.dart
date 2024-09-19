import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diskuss_task/bloc/contact_bloc.dart';
import 'package:diskuss_task/bloc/contact_event.dart';
import 'package:diskuss_task/bloc/contact_state.dart';
import 'package:diskuss_task/models/contact.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact List')),
      body: BlocBuilder<ContactListBloc, ContactListState>(
        builder: (context, state) {
          if (state is ContactListUpdated && state.contacts.isNotEmpty) {
            final contacts = state.contacts;
            return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return buildContactTile(context, contact);
              },
            );
          } else {
            return const Center(
              child: Text("No Contacts Found"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  // Build a contact list tile with delete functionality
  Widget buildContactTile(BuildContext context, Contact contact) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(contact.name),
      subtitle: Text(contact.phoneNumber),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // IconButton(
          //   icon: const Icon(Icons.edit),
          //   onPressed: () => showEditDialog(context, contact),
          // ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context
                  .read<ContactListBloc>()
                  .add(DeleteContact(contact: contact));
            },
          ),
        ],
      ),
    );
  }

  // Dialog to add a new contact
  void showAddDialog(BuildContext context) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Contact'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  phoneController.text.isNotEmpty) {
                final name = nameController.text;
                final phoneNumber = phoneController.text;

                // Add contact using BLoC
                context.read<ContactListBloc>().add(
                      AddContact(
                          contact:
                              Contact(name: name, phoneNumber: phoneNumber)),
                    );

                Navigator.pop(context); // Close the dialog after adding
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  // Dialog to edit an existing contact
  // void showEditDialog(BuildContext context, Contact contact) {
  //   final nameController = TextEditingController(text: contact.name);
  //   final phoneController = TextEditingController(text: contact.phoneNumber);

  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text('Edit Contact'),
  //       content: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           TextField(
  //             controller: nameController,
  //             decoration: const InputDecoration(labelText: 'Name'),
  //           ),
  //           TextField(
  //             controller: phoneController,
  //             decoration: const InputDecoration(labelText: 'Phone Number'),
  //           ),
  //         ],
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () {
  //             if (nameController.text.isNotEmpty &&
  //                 phoneController.text.isNotEmpty) {
  //               final updatedName = nameController.text;
  //               final updatedPhoneNumber = phoneController.text;

  //               // Update the contact using BLoC
  //               context.read<ContactListBloc>().add(
  //                 UpdateContact(
  //                   contact: Contact(name: updatedName, phoneNumber: updatedPhoneNumber),
  //                 ),
  //               );

  //               Navigator.pop(context); // Close the dialog after editing
  //             }
  //           },
  //           child: const Text('Save'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
