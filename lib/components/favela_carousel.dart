import 'package:favelasemcorona/models/favelas.dart';
import 'package:favelasemcorona/screens/entrepreneurs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavelaCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.orangeAccent,
      // ignore: missing_return
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: favelas.length,
          itemBuilder: (BuildContext context, int index) {
        Favela favela = favelas[index];
        return GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_)
          => EntrepreneursScreen(favela: favela,),),),
          child: Container(
            margin: EdgeInsets.all(10),
            width: 210,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Positioned(bottom: 15.0,
                child: Container(
                  height: 120,
                  width: 200,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('${favela.communityName}', style: TextStyle(
                            fontFamily: 'Comic Neue', fontSize: 16,
                            fontWeight: FontWeight.w600, letterSpacing: 0.5,
                            color: Colors.deepOrange),),
                        SizedBox(height: 2,),
                        Text('${favela.population}', style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 2,)
                      ],
                    ),
                  ),
                ),),
                Container(decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.black26, offset:
                  Offset(0,2), blurRadius: 6),],
                ),
                child: Stack(
                  children: <Widget>[
                    Hero(
                      tag: favela.imageUrl,
                      child: ClipRRect(borderRadius: BorderRadius.circular(20),
                      child: Image(height: 180, width: 180, image: AssetImage
                        (favela.imageUrl), fit: BoxFit.cover)),
                    ),
                    Positioned(
                      left: 10,
                      bottom: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(FontAwesomeIcons.headSideMask, size: 10, color:
                              Colors
                                  .white,),
                              SizedBox(width: 5,),
                              Text('${favela.totalCases}', style: TextStyle(fontFamily:
                              'Comic Neue', fontSize: 20, fontWeight: FontWeight
                                      .w600, color: Colors.white),),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(FontAwesomeIcons.skullCrossbones, size: 10, color:
                              Colors
                                  .white,),
                              SizedBox(width: 5,),
                              Text('${favela.deaths}', style: TextStyle
                                (fontSize: 12, fontWeight: FontWeight.w600,
                                  color: Colors.white),)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
