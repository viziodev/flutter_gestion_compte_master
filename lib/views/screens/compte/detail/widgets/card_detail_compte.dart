import 'package:flutter/material.dart';
import 'package:flutter_gestion_student/models/compte.dart';

class CardCompteDetail extends StatelessWidget {
  final Compte compte;
  const CardCompteDetail({super.key,required this.compte});
  @override
  Widget build(BuildContext context) {
    return  Card(
                    margin: const EdgeInsets.all(16),
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Compte N°: ${compte.numero}',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Solde: ${compte.solde} CFA',
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
                  );
  }
}