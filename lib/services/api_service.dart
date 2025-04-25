import 'dart:convert';


import 'package:flutter_gestion_student/models/compte.dart';
import 'package:http/http.dart' as http;
class ApiService{
  final String baseUrl;

  ApiService({ this.baseUrl="http://localhost:3000"});
  
  //All Comptes 
        Future<List<Compte>>   findAllComptes()async{
             final response= await http.get(Uri.parse("$baseUrl/comptes"));
             if (response.statusCode==200) {
               List<dynamic> datas= json.decode(response.body);
                return  datas.map((data) => Compte.fromJson(data)).toList();
             }else{
              throw  Exception("Erreur de Requete");
             }
       }

  //Get Id Comptes 
        Future<Compte>   findComptesById(int id)async{
             final response= await http.get(Uri.parse("$baseUrl/comptes/$id"));
             if (response.statusCode==200) {
               dynamic data= json.decode(response.body);
                return   Compte.fromJson(data);
             }else{
              throw  Exception("Erreur de Requete");
             }
       }

  //Creer Comptes 
           Future<Compte>   addCompte(Compte compte)async{
              final response= await http.post(Uri.parse("$baseUrl/comptes"),
               headers:{
                 "Content-Type":"application/json"
               },
               body: json.encode(compte.toJson()) 
               );
             if (response.statusCode==201) {
                dynamic data= json.decode(response.body);
                return   Compte.fromJson(data);
             }else{
                throw  Exception("Erreur de Requete");
             }
       }

          Future<Compte>   updateCompte(Compte compte)async{
              final response= await http.put(Uri.parse("$baseUrl/comptes/${compte.id}"),
               headers:{
                 "Content-Type":"application/json"
               },
               body: json.encode(compte.toJson()) 
               );
             if (response.statusCode==200) {
               dynamic data= json.decode(response.body);
                return   Compte.fromJson(data);
             }else{
              throw  Exception("Erreur de Requete");
             }
       }


}