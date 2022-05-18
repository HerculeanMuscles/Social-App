
import 'package:sistconnect/backend/backend.dart';

class TutorView {
  final String id;
  final String title;
  final DateTime date;
  final String description;

  TutorView({
    this.id,
    this.title,
    this.date,
    this.description,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'date': date,
    'description' : description,
  };

  static TutorView fromJson(Map<String, dynamic> json) => TutorView(
      id: json['id'],
      title: json['title'],
      date: (json['date'] as Timestamp).toDate(),
      description: json['description'],
  );
}
