import 'package:flutter/material.dart';
import 'package:tes_app/models/place_model.dart';
import 'package:tes_app/screens/placedetail_screen.dart';
import 'package:tes_app/services/placesServices/maternity_service.dart';

class NearMaternity extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   

    return new NearMaternityState();
  }

}
class NearMaternityState extends State<NearMaternity>{
  @override
  Widget build(BuildContext context) {
   
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Nearby Maternity"),
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

    MaternityService.get().getNearbyPlaces().then((data){
        this.setState((){
          _places = data;
        });
      
    });
  }
}