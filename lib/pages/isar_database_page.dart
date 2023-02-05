import 'package:db_adapter_flutter/core/isar/isar_adapter_imp.dart';
import 'package:db_adapter_flutter/domain/notes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data_layer/repository/notes_local_repository_example.dart';

class IsarDatabasePage extends StatefulWidget {
  /// default constructor
  const IsarDatabasePage({
    super.key,
  });

  @override
  State<IsarDatabasePage> createState() => _IsarDatabasePageState();
}

class _IsarDatabasePageState extends State<IsarDatabasePage> {
  // the best idea is move this to another layer and pre-solve when app start
  final Future<IsarAdapterImp> _isarInit = IsarAdapterImp.initAdapter();

  // considering this is an example and the dataSource is in another layer in a real application
  INotesLocalRepositoryExample? _dataSource;

  final _controllerNote = TextEditingController();
  final _controllerLimit = TextEditingController();
  final _controllerRandom = TextEditingController();

  @override
  void initState() {
    super.initState();

    _isarInit.then((isar) {
      setState(() {
        _dataSource = NotesLocalRepositoryExample(isar);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              controller: _controllerNote,
            ),
            const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_dataSource == null || _controllerNote.text.isEmpty) return;

                          _dataSource!.createOneNote(_controllerNote.text);
                          _controllerNote.text = '';
                        },
                        child: const Text('Create Note'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_dataSource == null) return;

                          _dataSource!.createOneThousandRandomNotes();
                        },
                        child: const Text('Random notes'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Limit',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      TextFormField(
                        autocorrect: false,
                        controller: _controllerLimit,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly], // O
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Filter random greater than',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      TextFormField(
                        autocorrect: false,
                        controller: _controllerRandom,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly], // O
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (_dataSource != null)
              Expanded(
                child: StreamBuilder<List<Notes>>(
                  stream: _dataSource!.notesStream,
                  builder: (context, snapshot) {
                    final List<Notes> notes = [];
                    if (snapshot.hasData) {
                      notes.addAll(snapshot.requireData);
                    }

                    return notes.isEmpty
                        ? const Center(child: Text('No items'))
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              itemCount: notes.length,
                              itemBuilder: (_, index) => Container(
                                height: 80,
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        spreadRadius: -4,
                                        blurRadius: 8,
                                        offset: Offset(0, 4),
                                      )
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'id: ${notes[index].id.substring(0, 2)}',
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                          Expanded(
                                            child: Text(
                                              notes[index].text,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () => _dataSource!.deleteOneNote(notes[index].id),
                                            icon: const Icon(
                                              Icons.close,
                                              color: Colors.red,
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        'RandomNumber: ${notes[index].randomNumber}',
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}
