import 'package:flutter/material.dart';

class CompteListScreen extends StatefulWidget {
  const CompteListScreen({super.key});

  @override
  State<CompteListScreen> createState() => _CompteListScreenState();
}

class _CompteListScreenState extends State<CompteListScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
    child: SingleChildScrollView(
      child: Column(
        children:  List.generate(10,(index){
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
        })
              
        
      ),
    ),
  );
      
      
   
  }
}


/*
    Approche 1
   ListView(
       
        children: [
          for(int i=1;i<=10;i++)
              Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text('Compte N°: XXXX'),
                    subtitle: Text(
                      'Solde: 10000CFA',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                       onTap: () async {
                      
                      }
                    )
            )
        ],
      ),
        List.generate(10,(index){
                return  Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text('Compte N°: XXXX'),
                    subtitle: Text(
                      'Solde: 10000CFA',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                       onTap: () async {
                      
                      }
      );
      }

          ListView.builder(
              itemCount:10
              itemBuilder: (context, index) {
                  return  Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text('Compte N°: XXXX'),
                    subtitle: Text(
                      'Solde: 10000CFA',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                       onTap: () async {
                      
                      }
               );
          }
      */