import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:favelasemcorona/models/posto_de_saude.dart';



List<Marker> postosdesaudemarkers = [
Marker(
  markerId: MarkerId(postosdesaude[0].nome),
  position: LatLng(postosdesaude[0].lat,postosdesaude[0].lng),
  infoWindow: InfoWindow(title: postosdesaude[0].nome, snippet: postosdesaude[0].createSnippet()),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
),

 Marker(
  markerId: MarkerId(postosdesaude[1].nome),
  position: LatLng(postosdesaude[1].lat,postosdesaude[1].lng),
  infoWindow: InfoWindow(title: postosdesaude[1].nome),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed,),
),



];


Marker ps0Marker = Marker(
  markerId: MarkerId(postosdesaude[0].nome),
  position: LatLng(postosdesaude[0].lat,postosdesaude[0].lng),
  infoWindow: InfoWindow(title: postosdesaude[0].nome, snippet: postosdesaude[0].createSnippet()),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
);

Marker ps1Marker =  Marker(
  markerId: MarkerId(postosdesaude[1].nome),
  position: LatLng(postosdesaude[1].lat,postosdesaude[1].lng),
  infoWindow: InfoWindow(title: postosdesaude[1].nome, snippet: postosdesaude[1].createSnippet()),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed,),
);

Marker ps2Marker =  Marker(
  markerId: MarkerId(postosdesaude[2].nome),
  position: LatLng(postosdesaude[2].lat,postosdesaude[2].lng),
  infoWindow: InfoWindow(title: postosdesaude[2].nome, snippet: postosdesaude[2].createSnippet()),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed,),
);

Marker ps3Marker = Marker(
  markerId: MarkerId(postosdesaude[3].nome),
  position: LatLng(postosdesaude[3].lat,postosdesaude[3].lng),
  infoWindow: InfoWindow(title: postosdesaude[3].nome, snippet: postosdesaude[3].endereco),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed,),
);