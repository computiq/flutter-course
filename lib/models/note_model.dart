const String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    id,
    content,
    initDate,
    isFinished
  ];

  static const String id = '_id';
  static const String content = 'content';
  static const String initDate = 'initDate';
  static const String isFinished = 'isFinished';
}

class NoteModel {
  NoteModel(
      {this.id,
      required this.content,
      required this.initDate,
      required this.isFinished});
  int? id;
  String content;
  DateTime initDate;
  bool isFinished;

  NoteModel copy({
    int? id,
    String? content,
    DateTime? initDate,
    bool? isFinished,
  }) =>
      NoteModel(
          id: id ?? this.id,
          content: content ?? this.content,
          initDate: initDate ?? this.initDate,
          isFinished: isFinished ?? this.isFinished);

  static NoteModel fromJson(Map<String, Object?> json) => NoteModel(
        id: json[NoteFields.id] as int,
        content: json[NoteFields.content] as String,
        initDate: DateTime.parse(json[NoteFields.initDate] as String),
        isFinished: json[NoteFields.isFinished] == 1,
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.content: content,
        NoteFields.initDate: initDate.toIso8601String(),
        NoteFields.isFinished: isFinished ? 1 : 0,
      };
}
