import 'package:flutter/material.dart';
import 'package:tes_app/models/place_model.dart';
import 'package:tes_app/screens/placedetail_screen.dart';
import 'package:tes_app/services/placesServices/hospital_service.dart';
import 'package:tes_app/services/placesServices/place_services.dart';
import 'package:flutter/material.dart';

class NearHospital extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new NearHospitalState();
  }

}
class NearHospitalState extends State<NearHospital>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Nearby Hospitals"),
      ),
      body:_createContent(),
    );
  }

  Widget _createContent(){
    if(_places == null){
      return new Center(
        child: new CircularProgressIndicator(),
        );
    }
    else{
      return new ListView(
        children: _places.map((f){

          return new Card(child:
            new ListTile(
              title: new Text(f.name),
              leading: new Image.network(f.icon),
              subtitle: new Text (f.vicinity),
              onTap: () {
                handleTap(f);
              },
            ),
          );
        }).toList()

      );
    }
  }

  handleTap(Place place) {
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => new PlaceDetailScreen() ));
  }
  List<Place> _places;
  @override void initState(){
    super.initState();

    HospitalService.get().getNearbyPlaces().then((data){
        this.setState((){
          _places = data;
        });
      
    });
  }
}