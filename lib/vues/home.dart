import 'package:flutter/material.dart';
import 'package:ittalentsproject/Animation/FadeAnimation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ittalentsproject/Data/Formation_manager.dart';
import 'package:ittalentsproject/Model/Formation_model.dart';
import 'package:flutter_html/flutter_html.dart';

import 'Details_formation.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(

              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://mdfive.dz/ecole/wp-content/uploads/2020/12/background-scaled.jpg'),
                    fit: BoxFit.cover
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.2),
                        ]
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FadeAnimation(1, Text(
                      "Révélez vos competences", textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),)),
                    SizedBox(height: 30,),
                    FadeAnimation(1.3, Container(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search, color: Colors.grey,),
                            hintStyle: TextStyle(
                                color: Colors.grey, fontSize: 15),
                            hintText: "Recherchez votre formation"
                        ),
                      ),
                    )),
                    SizedBox(height: 30,)
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1, Text("Catégories", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontSize: 20),)),
                  SizedBox(height: 20,),
                  FadeAnimation(1.4, Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        makeItem(
                            image: 'assets/images/canada.jpg', title: 'Canada'),
                        makeItem(
                            image: 'assets/images/Italy.jpg', title: 'Italy'),
                        makeItem(
                            image: 'assets/images/greece.jpg', title: 'Greece'),
                        makeItem(image: 'assets/images/united-states.jpg',
                            title: 'United States')
                      ],
                    ),
                  )),

                  SizedBox(height: 30,),
                  FadeAnimation(1, Text("Nos formations", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontSize: 20),)),
                  // SizedBox(height: 1,),
                  FadeAnimation(1.4,
                    FutureBuilder(
                      future: Formation_manager.get_formation(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          print(snapshot.data.length);
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                Formation formation = snapshot.data[index];
                                print(formation.image.guid);
                                print(formation.title.rendered);
                                print(formation.date);
                                print( formation.rating);
                                    print(formation.duration);
                                    print( formation.dateStatus[0]);
                                print(formation.profile);
                                print(formation.image.postTitle);
                                print( formation.content.rendered);
                                print(formation.link);
                                return Column(children: [FadeAnimation(1.2,
                                    Formationlist_screen(
                                      imgUrl: formation.image.guid,
                                      title: formation.title.rendered,
                                      date: formation.date,
                                      rating: formation.rating,
                                      duration: formation.duration,
                                      confirmed: formation.dateStatus[0],
                                      formateur: formation.profile,
                                       partenaire: formation.image.postTitle,
                                       content: formation.content.rendered,
                                       link:formation.link)),
                                ]);
                              }
                          );
                        }
                        else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },

                    ),
                  ),
                  SizedBox(height: 80,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
    Widget makeItem({image, title}) {
      return AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          margin: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover
              )
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.2),
                    ]
                )
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title, style: TextStyle(color: Colors.white, fontSize: 15),),
            ),
          ),
        ),
      );
    }
  }
class Formationlist_screen extends StatelessWidget {
  final String imgUrl;
  final String title;
  final DateTime date;
  final dynamic rating;
  final dynamic duration;
  final String confirmed;
  final String partenaire;
  final String content;
  final String formateur;
  final String link;

  Formationlist_screen(
      { @required this.imgUrl,
        @required this.title,
        @required this.date,
        @required this.rating,
        @required this.duration,
        @required this.confirmed,
        @required this.partenaire,
        @required this.content,
        @required this.formateur,
        @required this.link
       }     );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FadeAnimation(1, Details_formation(
                rating: rating,
                imgUrl: imgUrl,
                title: title,
                date: date,
                confirmed: confirmed,
                duration: duration,
                partenaire: partenaire,
                content: content,
                formateur: formateur,
                link:link))));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            color: Color(0xffE9F4F9), borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
           
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                width: 110,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),

            Expanded(
                 child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                     child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Container(
                            padding: const EdgeInsets.only(bottom:8),
                            child: Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff4E6059)),
                            ),
                          ),

                        SizedBox(
                          height: 5,
                        ),

                           Row(
                             children: [Icon(
                               Icons.calendar_today_sharp,
                               color: Color(0xff139157),
                               size: 20,
                             )
                               ,
                               SizedBox(
                                 width: 5,
                               ),

                               Text(
                              date.day.toString()+"/"+date.month.toString()+"/"+date.year.toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff4E6059)),
                          ),
                           ],),
                        SizedBox(
                          height: 5,
                        ),

                        Row(
                          children: [Icon(
                            Icons.watch_later_outlined,
                            color: Color(0xff139157),
                            size: 20,
                          )
                            ,
                            SizedBox(
                              width: 5,
                            ),

                            Text(
                              duration.toString()+"jours",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff4E6059)),
                            ),
                          ],),
                      ],
                    ),

              ),
               ),
           // ),
            Container(
                margin: EdgeInsets.only(bottom: 10, right: 8),
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Color(0xff139157)),
                child: Column(

                  children: [
                    Text(
                     ("$rating" != "[]" ) ? "$rating":0.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 20,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}



