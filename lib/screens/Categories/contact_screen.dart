import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diskuss_task/bloc/contact_bloc.dart';
import 'package:diskuss_task/bloc/contact_event.dart';
import 'package:diskuss_task/bloc/contact_state.dart';
import 'package:diskuss_task/models/contact.dart';
import 'package:uuid/uuid.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact List',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        backgroundColor:
            Colors.transparent, // Make the AppBar background transparent
        elevation: 0, // Remove shadow for a smoother gradient effect
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.white), // Set back arrow color to white
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.blue[900]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
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
        backgroundColor: Color(0xff002855),
        foregroundColor: Colors.white,
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
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => showEditDialog(context, contact),
          ),
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
    final uuid = Uuid();
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
                          contact: Contact(
                              id: uuid.v4(),
                              name: name,
                              phoneNumber: phoneNumber)),
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
  void showEditDialog(BuildContext context, Contact contact) {
    final nameController = TextEditingController(text: contact.name);
    final phoneController = TextEditingController(text: contact.phoneNumber);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Contact'),
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
                final updatedName = nameController.text;
                final updatedPhoneNumber = phoneController.text;

                // Trigger the UpdateContact event with the same ID
                context.read<ContactListBloc>().add(
                      UpdateContact(
                        contact: Contact(
                          id: contact.id, // Keep the same ID
                          name: updatedName,
                          phoneNumber: updatedPhoneNumber,
                        ),
                      ),
                    );

                Navigator.pop(context); // Close the dialog after editing
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
