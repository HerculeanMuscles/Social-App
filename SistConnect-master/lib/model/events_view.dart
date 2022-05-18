import 'package:sistconnect/backend/backend.dart';

class EventsView {
  final String id;
  final String title;
  final String image;
  final DateTime date;
  final String description;

  EventsView({
    this.id,
    this.title,
    this.date,
    this.description,
    this.image,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'description': description,
        'image': image,
      };

  static EventsView fromJson(Map<String, dynamic> json) => EventsView(
      id: json['id'],
      title: json['title'],
      date: (json['date'] as Timestamp).toDate(),
      description: json['description'],
      image: json['image']);
}
