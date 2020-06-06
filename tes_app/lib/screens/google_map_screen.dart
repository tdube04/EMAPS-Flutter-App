// import 'package:flutter/material.dart';
// import 'package:google_map_polyline/google_map_polyline.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapRoute extends StatefulWidget {
//   @override
//   _MapRouteState createState() => _MapRouteState();
// }

// class _MapRouteState extends State<MapRoute> {
//   final Set<Polyline> polyline = {};

//   GoogleMapController _controller;
//   List<LatLng> routeCoords;
//   GoogleMapPolyline googleMapPolyline =
//       new GoogleMapPolyline(apiKey:"AIzaSyDi5CK2rT2F2AqSdht9sK3cURFZ2xFQseg");
  
//   getsomePoints() async{
//     // var permissions =
//     //       await Permission.getPermissionStatus([PermissionName.Location]);
//     routeCoords = await googleMapPolyline.getCoordinatesWithLocation(
//       origin: LatLng(37.422, -122.084), 
//       destination: LatLng(37.722, -122.884), 
//       mode: RouteMode.driving);
//   }
// @override
//  void initState() {
//    super.initState();
//    getsomePoints();
//  }
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body: GoogleMap(
//         onMapCreated: onMapCreated,
//         polylines: polyline,
//         initialCameraPosition: CameraPosition(target: LatLng(37.422, -122.084),
//         zoom: 14.0
//         ),
//         mapType: MapType.normal,
//       )
//     );
//   }

//   void onMapCreated(GoogleMapController controller) {
//     setState(() {
//       _controller = controller;

//       polyline.add(Polyline(
//         polylineId: PolylineId('route1'),
//         visible: true,
//         points: routeCoords,
//         width: 4,
//         color: Colors.green,
//         startCap: Cap.buttCap      ));
//     });
//   }
// }