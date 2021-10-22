class ToDo {
  int? id;
  final String title;
  DateTime creationDate;

  bool isChecked;

  ToDo(
      {this.id,
      required this.title,
      required this.creationDate,
      required this.isChecked});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "creationData": creationDate.toString(),
      "isChecked": isChecked ? 1 : 0,
    };
  }
}
