class Contact {
  final String id; // Ensure unique IDs
  final String name;
  final String phoneNumber;

  Contact({required this.id, required this.name, required this.phoneNumber});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Contact && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
