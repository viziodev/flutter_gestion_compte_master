import 'package:flutter/material.dart';

class CardItemCompte extends StatefulWidget {
  
  const CardItemCompte({super.key});

  @override
  State<CardItemCompte> createState() => _CardItemCompteState();
}

class _CardItemCompteState extends State<CardItemCompte> {
  @override
  Widget build(BuildContext context) {
     return  Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text('Compte N°: XXXXccccccccccc'),
                    subtitle: Text(
                      'Solde: 10000cccccccccccCFA',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                       onTap: () async {
                          Navigator.pushNamed(context, "/detail");
                    }
                                  )
   );
  }
}