import 'package:flutter/material.dart';
import 'package:flutter_gestion_student/utils/constants.dart';

class CompteFormScreen extends StatefulWidget {
  const CompteFormScreen({super.key});

  @override
  State<CompteFormScreen> createState() => _CompteFormScreenState();
}

class _CompteFormScreenState extends State<CompteFormScreen> {

   final _formKey = GlobalKey<FormState>();
   final _numeroController = TextEditingController();
   final _montantController = TextEditingController();
    bool _isLoading = false;

  @override
  void dispose() {
    _numeroController.dispose();
    _montantController.dispose();
    super.dispose();
  }

  void _submitForm()  {
    if (_formKey.currentState!.validate()) {
        setState(() {
        _isLoading = true;
        });

        //Creation du Compte 
        //Appel au service 
        //Envoie Message 
         ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Compte créé avec succès')),
        );

        //Fermer la Fenetre
         Navigator.pop(context, true);
     }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un Compte'),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
                 TextFormField(
                 controller: _numeroController,
                 decoration: const InputDecoration(
                  labelText: 'Numéro de compte',
                   border: OutlineInputBorder(),
                 ),
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un numéro de compte';
                  }
                   return null;
                },
              ),
              const SizedBox(height: 16),
               TextFormField(
                controller: _montantController,
                decoration: const InputDecoration(
                  labelText: 'Solde',
                  border: OutlineInputBorder(),
                ),
                 keyboardType: TextInputType.number,
                 validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un Solde';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Veuillez entrer un Solde valide';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                 onPressed: _isLoading ? null : _submitForm,
                 child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Créer le compte'),
               ),
            ],
          )
        ),
      ),
   );
  }
}