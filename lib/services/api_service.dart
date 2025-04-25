import 'dart:convert';


import 'package:flutter_gestion_student/models/compte.dart';
import 'package:http/http.dart' as http;
class ApiService{
  final String baseUrl;
  final http.Client _client;

  ApiService({this.baseUrl="http://10.0.2.2:3000",http.Client? client}) : _client = client ?? http.Client();

  
  //All Comptes 
        Future<List<Compte>>   findAllComptes()async{
              final response= await _client.get(Uri.parse("$baseUrl/comptes"),headers: {
                 'Content-Type': 'application/json',
             },);
            
             if (response.statusCode==200) {
               List<dynamic> datas= json.decode(response.body);
                 var data= datas.map((data) => Compte.fromJson(data)).toList();
                 print(data);
                 return data;
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