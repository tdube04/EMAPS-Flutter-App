
import 'package:flutter/material.dart';
import 'package:tes_app/screens/placesScreens/near_fireB_screen.dart';
import 'package:tes_app/screens/placesScreens/near_hospital_screen.dart';
import 'package:tes_app/screens/placesScreens/near_maternityClinic_screen.dart';
import 'package:tes_app/screens/placesScreens/places_screen.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(
          title: Text("DashBoard"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover),
            ),
            padding: EdgeInsets.fromLTRB(34.0, 177.0, 0.0, 0.0 ),
            
            child: GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                Card(
                    margin: EdgeInsets.all(14.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => new PlacesScreen(),
                          ),
                        );
                      },
                      splashColor: Colors.blueAccent,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.home, size: 70.0),
                          Text("POLICE", style: new TextStyle(fontSize: 17.0)),
                        ],
                      )),
                    )),
                    Card(
                    margin: EdgeInsets.all(14.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => new NearHospital(),
                          ),
                        );
                      },
                      splashColor: Colors.blueAccent,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.home, size: 70.0),
                          Text("AMBULANCE", style: new TextStyle(fontSize: 17.0)),
                        ],
                      )),
                    )),
                    Card(
                    margin: EdgeInsets.all(14.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => new NearFireStation(),
                          ),
                        );
                      },
                      splashColor: Colors.blueAccent,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.home, size: 70.0),
                          Text("FIRE-BRIGADE", style: new TextStyle(fontSize: 17.0)),
                        ],
                      )),
                    )),
                    Card(
                    margin: EdgeInsets.all(14.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => new NearMaternity(),
                          ),
                        );
                      },
                      splashColor: Colors.blueAccent,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.home, size: 70.0),
                          Text("MATERNITY", style: new TextStyle(fontSize: 17.0)),
                        ],
                      )),
                    )),
              ],
            )));
  }
}








// import 'package:flutter/material.dart';
// import 'package:flutter/semantics.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:tes_app/screens/places_screen.dart';

// class GridLayout extends StatelessWidget{
//   List<String> events = [
//     "Police ",
//     "Ambulance ",
//     "Fire-Brigade ",
//     "Maternity",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/images/bg.png"),fit: BoxFit.cover),),child: Container(
//             margin: const EdgeInsets.only(top: 120.0),
//             child: GridView(
//                 physics: BouncingScrollPhysics(), // only for ios
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), // 2items per row
//                 children: events.map((title){
//                   // loop all item in events list
//                   return GestureDetector(
//                     child: Card(
//                       margin: const EdgeInsets.all(20.0),
//                       child: getCardByTitle(title),
//                     ),
//                     onTap:(){
//                     // show toast
//                     Fluttertoast.showToast(
//                       msg: title + " Clicked",
//                       toastLength: Toast.LENGTH_SHORT,
//                       gravity: ToastGravity.CENTER,
//                       backgroundColor: Colors.red,
//                       textColor: Colors.white,
//                       fontSize:16.0
//                     );
//                     Navigator.push(
//                                   context,
//                                   new MaterialPageRoute(
//                                     builder: (context) => new PlacesScreen(),
//                                   ),
//                                 );
//                     },);
                
//                 }).toList(),
//               ),
//             ),
//       ),);
//   }

//  Column getCardByTitle(String title) {
//    String img ="";
//    if (title == "Police ")
//       img = "PlacesScreen()";
//    else if (title == "Ambulance ")
//     img = "assets/images/fireball.png";
//     else if (title == "Fire-Brigade ")
//     img = "assets/images/friends.png";
//     else
//       img = "assets/images/lovely_time.png";

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         new Center(
//           child: Container(
//             child: new Stack(
//               children: <Widget>[
//                 new Image.asset(
//                   img,
//                   width:80.0,
//                   height: 80.0),
//               ],
//             ),),
//         ),
//         Text(
//           title,style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//           textAlign: TextAlign.center,
//         )
//       ],
//     );

   
//  }
// }
