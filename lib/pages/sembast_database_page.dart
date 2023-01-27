import 'package:db_adapter_flutter/core/sembast/sembast_adapter_imp.dart';
import 'package:db_adapter_flutter/data_layer/repository/notes_local_repository_example.dart';
import 'package:db_adapter_flutter/domain/notes.dart';
import 'package:flutter/material.dart';

class SembastDatabasePage extends StatefulWidget {
  /// default constructor
  const SembastDatabasePage({
    super.key,
  });

  @override
  State<SembastDatabasePage> createState() => _SembastDatabasePageState();
}

class _SembastDatabasePageState extends State<SembastDatabasePage> {
  // the best idea is move this to another layer and pre-solve when app start
  final Future<SembastAdapterImp> _sembastInit = SembastAdapterImp.initAdapter();

  // considering this is an example and the dataSource is in another layer in a real application
  INotesLocalRepositoryExample? _dataSource;

  TextEditingController controller = TextEditingController();
  final List<Notes> notes = [];

  @override
  void initState() {
    super.initState();

    _sembastInit.then((sembast) {
      setState(() {
        _dataSource = NotesLocalRepositoryExample(sembast);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextFormField(
              autocorrect: false,
              controller: controller,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_dataSource == null) return;

              _dataSource!.createOneNote(controller.text);
            },
            child: Text('Create Note'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_dataSource == null) return;

              _dataSource!.createOneThousandRandomNotes();
            },
            child: Text('Create random notes'),
          ),
          if (_dataSource != null)
            Expanded(
              child: StreamBuilder<List<Notes>>(
                stream: _dataSource!.notesStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    notes.clear();

                    notes.addAll(snapshot.requireData);
                  }

                  return notes.isEmpty
                      ? Center(child: Text('No items'))
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            itemCount: notes.length,
                            itemBuilder: (_, index) => Container(
                              height: 50,
                              margin: EdgeInsets.all(8),
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
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        notes[index].text,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () => _dataSource!.deleteOneNote(notes[index].id),
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ),
                                    )
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
    );
  }
}
