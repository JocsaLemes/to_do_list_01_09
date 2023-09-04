import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_01_09/model/listas.dart';

class ListaPadrao extends StatelessWidget {
  const ListaPadrao({
    super.key,
    required this.listas,
    required this.onDelete,
  });

  final Listas listas;
  final Function(Listas) onDelete;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (value) {
              onDelete(listas);
              print("deletar");
            },
            icon: Icons.delete,
            backgroundColor: Colors.red,
            label: "Deletar",
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                  child: Text(
                    listas.title,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w100),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  DateFormat("dd/MM/yyyy - HH:mm").format(listas.dateTime),
                  style: const TextStyle(
                      fontWeight: FontWeight.w100, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
