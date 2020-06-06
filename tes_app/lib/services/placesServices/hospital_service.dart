import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tes_app/models/place_model.dart';

class HospitalService{
  static final _services = new HospitalService();
  static HospitalService get(){
    return _services;
  }
  final String searchUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-17.825167,31.033510&rankby=distance&type=hospital&key=AIzaSyBp6u3z-XV1eRfuA_-LU5mtJJBwnGI3La4";

  Future<List<Place>> getNearbyPlaces() async{
    var response = await http.get(searchUrl,headers:{"Accept":"application/json"});
    var places = <Place>[];

    List data = json.decode( response.body)["results"];

    data.forEach((f) => places.add(new Place(f["icon"],f["name"],f["rating"].toString(), f["vicinity"],f["place_id"])));
    return places;
  }
}