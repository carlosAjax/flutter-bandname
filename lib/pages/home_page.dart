import 'package:bandas_name/models/banda.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Banda> bandas = [
    Banda(id: '1', name: 'uno', votes: 3),
    Banda(id: '2', name: 'dos', votes: 13),
    Banda(id: '3', name: 'tres', votes: 33),
    Banda(id: '4', name: 'cuatro', votes: 35),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'band names',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: ListView.builder(
        itemCount: bandas.length,
        itemBuilder: (context, index) => _bandaStyle(bandas[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewBanda,
        elevation: 1,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _bandaStyle(Banda banda) {
    return Dismissible(
      onDismissed: (direction) {
        print('direccion: $direction');
        print('id: ${banda.id}');
      },
      key: Key(banda.id),
      direction: DismissDirection.startToEnd,
      background: Container(
        padding: EdgeInsets.only(left: 15.0),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'delete banda',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(banda.name.substring(0, 2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(banda.name),
        trailing: Text(
          banda.votes.toString(),
          style: const TextStyle(fontSize: 20),
        ),
        onTap: () {
          print(banda.name);
        },
      ),
    );
  }

  void addNewBanda() {
    final textEditController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('new Band name'),
          content: TextField(
            controller: textEditController,
          ),
          actions: [
            MaterialButton(
              elevation: 0,
              onPressed: () => addBandToList(textEditController.text),
              child: const Text('Add'),
              textColor: Colors.blue,
            ),
          ],
        );
      },
    );
  }

  void addBandToList(String name) {
    print(name);
    if (name.length > 1) {
      bandas.add(Banda(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }
    Navigator.pop(context);
  }
}
