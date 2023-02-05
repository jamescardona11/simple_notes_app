import 'package:rxdart/subjects.dart';
import 'package:simple_notes_app/core/db_core.dart';
import 'package:simple_notes_app/old/data_layer/core_db/mixin_single_data_source.dart';
import 'package:simple_notes_app/old/domain/notes.dart';

import '../dto/notes_dto.dart';

abstract class INotesLocalRepositoryExample {
  Stream<List<Notes>> get notesStream;

  Future<void> createOneNote(String text);

  Future<void> createOneThousandRandomNotes();

  Future<void> deleteOneNote(String id);
}

class NotesLocalRepositoryExample extends INotesLocalRepositoryExample with CarbonSingleDataSourceMixin<ICarbonAdapter, NotesDTO> {
  /// default constructor
  NotesLocalRepositoryExample(this.adapterDb) {
    _listenStreams();
  }

  @override
  final ICarbonAdapter adapterDb;

  @override
  String get tableName => 'notes';

  final BehaviorSubject<List<Notes>> _streamForReadAllNotes = BehaviorSubject<List<Notes>>.seeded([]);

  void _listenStreams() {
    readWhere().map((dtos) => dtos.map((noteDto) => noteDto.toEntity()).toList()).listen((notes) {
      _streamForReadAllNotes.add(notes);
    });
  }

  @override
  Stream<List<Notes>> get notesStream => _streamForReadAllNotes;

  @override
  Future<void> createOneNote(String text) async {
    final note = Notes.fromString(text);

    await create(NotesDTO.fromEntity(note));
  }

  @override
  Future<void> createOneThousandRandomNotes() async {
    List<Notes> notes = [];
    for (int i = 0; i < 1000; i++) {
      notes.add(Notes.random());
    }
    await createMany(notes.map((note) => NotesDTO.fromEntity(note)));
  }

  @override
  Future<void> deleteOneNote(String id) async {}

  @override
  NotesDTO fromJson(Map<String, dynamic> json) {
    return NotesDTO.fromJson(json);
  }
}
