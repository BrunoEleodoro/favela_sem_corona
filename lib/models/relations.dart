import 'package:favelasemcorona/models/favelas.dart';
import 'package:favelasemcorona/models/posto_de_saude.dart';
import 'favelas.dart';

class Relations {

  Relations({
    this.favela,
    this.postoDeSaude,
    this.clinicasDaFamilia,

  });

  Favela favela;
  PostoDeSaude postoDeSaude;
  List<PostoDeSaude> clinicasDaFamilia;

}


List<Relations> relations = [
  Relations(
    favela: favelas[0],
    postoDeSaude: PostoDeSaude(),
    clinicasDaFamilia: [],
  ),
];