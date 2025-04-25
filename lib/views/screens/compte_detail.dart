import 'package:flutter/material.dart';

class CompteDetailScreen extends StatefulWidget {
  const CompteDetailScreen({super.key});

  @override
  State<CompteDetailScreen> createState() => _CompteDetailScreenState();
}

class _CompteDetailScreenState extends State<CompteDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Comptes'),
      ),
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
                Card(
                    margin: const EdgeInsets.all(16),
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Compte N°: XX',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Solde: 1000 CFA',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Date de création: ',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

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