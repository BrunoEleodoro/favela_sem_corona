import 'package:favelasemcorona/screens/main_menu_screen.dart';
import 'package:favelasemcorona/screens/posto_de_saude_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:favelasemcorona/models/posto_de_saude.dart';


class MapsDemo extends StatefulWidget {
  static const id = 'maps_demo';

  MapsDemo({this.postoDeSaude});
  final PostoDeSaude postoDeSaude;

  @override
  _MapsDemoState createState() => _MapsDemoState();
}

class _MapsDemoState extends State<MapsDemo> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = LatLng(-22.9892591,-43.2542239);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;
  static final CameraPosition _position1 = CameraPosition(
    bearing: 192.833,
    target: LatLng(-22.8852092,-43.5232072),
    zoom: 13,
  );


  @override
  void initState() {

    int index = 0;

    while(index < postosdesaude.length){
      _markers.add(Marker(
        markerId: MarkerId(postosdesaude[index].nome),
        position: LatLng(postosdesaude[index].lat, postosdesaude[index].lng),
        infoWindow: InfoWindow(title: postosdesaude[index].nome,
            snippet: postosdesaude[index].createSnippet()),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),));
      index++;
    }
  }



//   ignore: missing_return
  Future<void> _goToPosition1() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_position1));
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setState(() {});
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType =
      _currentMapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
            title: 'Isso eh um Titulo', snippet: 'Isso eh um snippet'),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  Widget MyButton(Function function, IconData icon) {
    return FlatButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      child: Icon(icon, size: 36.0,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                  target: _center, zoom: 11.0),
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCameraMove,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.black,
                  iconSize: 40,
                  onPressed: (){Navigator.pushReplacementNamed(context, MenuIconsScreen.id);}),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 10.0),
                width: double.maxFinite,
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: postosdesaude.length,
                  itemBuilder: (BuildContext context, int index) {
                    PostoDeSaude postoDeSaude = postosdesaude[index];
                    //TODO: como eu tiro essa navegacao para o PostoDeSaudeScreen daqui?
                    return GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PostoDeSaudeScreen(postoDeSaude: postoDeSaude,),),),
                      child: Container(
                        margin: EdgeInsets.all(8),
                        width: 200,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Positioned(bottom: 15,
                            child: Container(
                              height: 120,
                              width: 200,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('${postoDeSaude.nome}', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, letterSpacing: 0.2, color: Colors.indigo),),
                                    SizedBox(height: 2.0,),
                                    Text('${postoDeSaude.endereco}', style: TextStyle(color: Colors.grey, fontSize: 12),),
                                    SizedBox(height: 2.0,),
                                    Text('Tel: ${postoDeSaude.telefone}', style: TextStyle(color: Colors.black38, fontSize: 12),),
                                  ],
                                ),
                              ),
                            ),),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
  }
}


//itemCount: _markers.length,
//itemBuilder: (context, index){
//return Container(
//margin: EdgeInsets.all(8),
//child: Card(
//child: Center(
//child: Text(_markers.elementAt(index).markerId.value),
//),
//elevation: 5,
//),
//width: 200,
//height: 100,
//);
//},


