import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gestion_student/models/compte.dart';
import 'package:flutter_gestion_student/services/api_service.dart';
import 'package:flutter_gestion_student/utils/constants.dart';
import 'package:flutter_gestion_student/views/screens/compte/list/widgets/card_list_widget.dart';

class CompteListScreen extends StatefulWidget {
  final ApiService apiService;
  const CompteListScreen({super.key, required this.apiService});

  @override
  State<CompteListScreen> createState() => _CompteListScreenState();
}

class _CompteListScreenState extends State<CompteListScreen> {
   late Future<List<Compte>> _comptesFuture;
  void _refreshComptes() {
      setState(() {
           print("ok");
        _comptesFuture = widget.apiService.findAllComptes();
      });
    }

    @override
  void initState() {
    super.initState();
         _refreshComptes();
  
     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appTitle),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                       Navigator.pop(context);
                       Navigator.pushNamed(context, "/");
              },
            ),
             const Divider(),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('List des Comptes'),
              onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/comptes");
              },
            ),
             const Divider(),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet),
              title: const Text('Creer un compte'),
              onTap: () {
                 /*   Navigator.pop(context);
                      Navigator.push(
                     context,
                      MaterialPageRoute(
                     builder: (context) => const CompteFormScreen()),
                    );
                    */
                     Navigator.pop(context);
                    Navigator.pushNamed(context, "/add");
              },
            ),
           const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Quitter'),
              onTap: () {
                
              },
             ),
            
          ]
        )
        ),
        body: SafeArea(
    child: SingleChildScrollView(
      child: Column(
        children: [
              FutureBuilder<List<Compte>>(
                future: _comptesFuture,
                builder: (context, snapshot) { 
                 if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                  }else if (snapshot.hasError) {
                     return Center(
                        child: Text('Erreur: ${snapshot.error}'),
                      );
                 }else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                   return const Center(
                      child: Text('Aucun compte trouvé'),
                  );
                 }else{
                      final comptes = snapshot.data!;
                           return ListView.builder(
                              itemCount: comptes.length,
                               shrinkWrap: true, // Force la liste à s'adapter à son contenu
                               physics: NeverScrollableScrollPhysics(), // Désactive le défilement de cette liste
                              itemBuilder: (context, index) {
                                 final compte = comptes[index];
                                 print(compte);
                                    return  CardItemCompte(compte: compte,onClick: (){
                                             Navigator.pushNamed(context, "/detail",arguments: {
                                                  "compte":compte
                                             });
                                  });
                            }
                           );
                 }
               },)
        ]
              
          ),
         ),
       ),
        bottomNavigationBar: BottomNavigationBar(
                onTap: (index) {
                       var routeName="/comptes";
                         Navigator.pushNamed(context, routeName);
               },
              items:const  [
                BottomNavigationBarItem(
                 icon: Icon(Icons.home),
                 label: 'Home',
                ),
                BottomNavigationBarItem(
                 icon: Icon(Icons.account_balance_wallet),
                 label: 'Comptes',
               ),
                BottomNavigationBarItem(
                 icon: Icon(Icons.access_time),
                 label: 'Comptes',
               )
          
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
                   Navigator.pushNamed(context, "/add");
            
          },
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