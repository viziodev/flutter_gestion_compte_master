// ignore_for_file: public_member_api_docs, sort_constructors_first
class Compte {
  final int id;
  final String numero;
   final DateTime dateCreation;
   double solde;

  Compte({
    required this.id,
    required this.numero,
    DateTime? date,
    this.solde=0
  }):dateCreation=date??DateTime.now();

  //POST, PUT Objet  Compte ==> Json(Map<String, dynamic>)
   Map<String, dynamic> toJson(){
    return {
      "id": "$id",
      "numero":numero,
      "dateCreation":dateCreation.toIso8601String(),
      "solde":solde
    };
   }
  //GET   Json   ==> Objet  Compte 
   factory Compte.fromJson( Map<String, dynamic> json){
    return Compte(
      id:int.parse(json["id"]),
      numero: json["numero"],
      date: DateTime.parse(json["dateCreation"]),
      solde:(json["solde"] as num).toDouble()
      );
   }
  @override
  String toString() {
    return 'Compte(id: $id, numero: $numero, dateCreation: $dateCreation, solde: $solde)';
  }
}
