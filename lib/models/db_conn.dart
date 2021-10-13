import 'package:contacts_01/models/note_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();
  static Database? _database;
  NotesDatabase._init();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';

    await db.execute('''
    CREATE TABLE $tableNotes (
      ${NoteFields.id} $idType,
      ${NoteFields.content} $textType,
      ${NoteFields.initDate} $textType,
      ${NoteFields.isFinished} $boolType
    )
    ''');
  }

  Future<NoteModel> create(NoteModel note) async {
    final db = await instance.database;
    final id = await db.insert(tableNotes, note.toJson());
    return note.copy(id: id);
  }

  Future<NoteModel> readNote(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id}=?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return NoteModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id NOT FOUND');
    }
  }

  Future<List<NoteModel>> readAllNote() async {
    final db = await instance.database;
    final orderDESC = '${NoteFields.initDate} DESC';
    final result = await db.query(tableNotes, orderBy: orderDESC);
    return result.map((json) => NoteModel.fromJson(json)).toList();
  }

  Future<int> update(NoteModel note) async {
    final db = await instance.database;
    return db.update(
      tableNotes,
      note.toJson(),
      where: '${NoteFields.id}=?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return db.delete(
      tableNotes,
      where: '${NoteFields.id}=?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
