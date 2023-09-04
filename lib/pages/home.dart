import 'package:flutter/material.dart';
import 'package:to_do_list_01_09/model/listas.dart';
import 'package:to_do_list_01_09/widgets/lista_molde.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Listas> listaTarefas = [];

  final TextEditingController listaControler = TextEditingController();

  void onDelete(Listas listas) {
    setState(() {
      listaTarefas.remove(listas);
    });
    print("chegou no deletar");
  }

  salvarArquivos() async {
    String text = listaControler.text;
    setState(() {
      Listas newListas = Listas(title: text, dateTime: DateTime.now());
      listaTarefas.add(newListas);
    });
    print("Chegou aqui");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 146, 230, 104),
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 85),
                child: ListView(
                  children: [
                    for (Listas lista in listaTarefas)
                      ListaPadrao(
                        listas: lista,
                        onDelete: onDelete,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Adicionar tarefas"),
                  content: TextField(
                    controller: listaControler,
                    decoration: const InputDecoration(
                      labelText: "Tarefa",
                      hintText: "Ex.: Estudar flutter",
                    ),
                    onChanged: (text) {},
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        salvarArquivos();
                        listaControler.clear();
                        Navigator.pop(context);
                      },
                      child: const Text("Enviar"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancelar"),
                    )
                  ],
                );
              });
        },
        tooltip: 'Enviar item',
        elevation: 20,
        icon: const Icon(Icons.add_alarm_sharp),
        label: const Text("Adicionar"),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none),
      ),
    );
  }
}
