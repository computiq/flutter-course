class Model {
  late int? id;
  late String content;
  late String noteDate;
  late String? end;

  Model({this.id, required this.content, required this.noteDate,required this.end});

  Model.fromMap(Map data) {
    id = data['ID'];
    content = data['content'];
    noteDate = data['noteDate'];
    end = data['isChecked'];
  }

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {'ID': id, 'content': content, 'noteDate': noteDate,'isChecked':end};
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'toDO{id: $id, name: $content,noteDate:$noteDate,isChecked:$end}';
  }

  get ID => id;

  get dateOfTheNote => noteDate;
}
