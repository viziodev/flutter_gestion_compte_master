import 'package:flutter/material.dart';
import 'package:flutter_gestion_student/models/compte.dart';

class CardItemCompte extends StatefulWidget {
  final Compte compte;
  final Function onClick;
  const CardItemCompte({super.key, required this.compte,required this.onClick});

  @override
  State<CardItemCompte> createState() => _CardItemCompteState();
}

class _CardItemCompteState extends State<CardItemCompte> {
  @override
  Widget build(BuildContext context) {
     return  Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text('Compte N°: ${widget.compte.numero}'),
                    subtitle: Text(
                      'Solde: ${widget.compte.solde }} CFA',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                       onTap:() => widget.onClick(),
                  )
   );
  }
}