class Events {
  String id;
  final String title;
  final String date;
  final String description;
  final String image;

  Events({
    this.id ='',
    this.title,
    this.date,
    this.description,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'description' : description,
      'image' : image,
    };
  }

  static Events fromJson(Map<String, dynamic> json) => Events(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      description: json['description'],
      image: json['image'],
  );
}
