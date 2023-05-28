// ignore_for_file: public_member_api_docs, sort_constructors_first
class Banda {
  String id;
  String name;
  int votes;
  Banda({
    required this.id,
    required this.name,
    required this.votes,
  });

  factory Banda.fromMap(Map<String, dynamic> obj) {
    return Banda(
      id: obj['id'],
      name: obj['name'],
      votes: obj['votes'],
    );
  }
}
