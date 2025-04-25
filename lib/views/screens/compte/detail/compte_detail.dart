import 'package:flutter/material.dart';
import 'package:flutter_gestion_student/models/compte.dart';
import 'package:flutter_gestion_student/views/screens/compte/detail/widgets/card_detail_compte.dart';

class CompteDetailScreen extends StatefulWidget {
  const CompteDetailScreen({super.key});

  @override
  State<CompteDetailScreen> createState() => _CompteDetailScreenState();
}

class _CompteDetailScreenState extends State<CompteDetailScreen> {

  @override
  Widget build(BuildContext context) {
       final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
       final compte = args["data"]as Compte;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Comptes'),
      ),
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
                  CardCompteDetail(compte: compte),
                    Padding(
                     padding: const EdgeInsets.all(16),
                     child: Text(
                       'Liste des Transactions',
                         style: Theme.of(context).textTheme.titleLarge,       
                  ),
            ),

               ListView.builder(
                    shrinkWrap: true,
                  //  physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                         return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: ListTile(
                          leading: Icon(
                            index%2==0
                                ? Icons.arrow_downward
                                : Icons.arrow_upward,
                            color:      index%2==0
                                ? Colors.green
                                : Colors.red,
                          ),
                          title: Text(
                                index%2==0
                                ? 'Dépôt'
                                : 'Retrait',
                          ),
                          subtitle: Text(
                            'Date: 12/04/2024',
                          ),
                          trailing: Text(
                            '${index%2==0 ? '+' : '-'}2000CFA',
                            style: TextStyle(
                              color:      index%2==0
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    })
          ]
        )
   ));
  }
}