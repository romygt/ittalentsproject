import 'package:flutter/material.dart';
import 'package:ittalentsproject/Animation/FadeAnimation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ittalentsproject/Data/Formation_manager.dart';
import 'package:ittalentsproject/Model/Formation_model.dart';
import 'package:flutter_html/flutter_html.dart';


class Details_formation extends StatefulWidget {
  final String imgUrl;
  final String title;
  final dynamic rating;
  final DateTime date;
  final String confirmed;
  final dynamic  duration;
  final String partenaire;
  final String content;
  final String formateur;

  Details_formation(
      {@required this.rating, @required this.imgUrl, @required this.title,@required this.date, @required this.confirmed,@required this.duration,@required this.partenaire,@required this.content,@required this.formateur});

  @override
  _Details_formationState createState() => _Details_formationState();
}

class _Details_formationState extends State<Details_formation> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.imgUrl,
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 350,
                    color: Colors.black54,
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(
                                width: 24,
                              ),

                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 23),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_outlined,
                                    color: Colors.white70,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    widget.date.toString()+"/"+widget.date.month.toString()+"/"+widget.date.year.toString(),
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RatingBar(double.parse(widget.rating).round()),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                     widget.rating,
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          height: 50,
                        )
                      ],
                    ),
                  )
                ],
              ),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    SizedBox(
                      width:120,height:140,
                      child: Column(children:[
                        FeaturesTile(
                              icon: Icon(Icons.access_alarms_rounded, color: Color(0xff5A6C64)),
                              label: "Durée"),

                        SizedBox(
                          height: 25,
                        ),
                          Text(
                            widget.duration+"jours",
                            style: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          )]
                      ),
                    ),
                    SizedBox(
                      width:120,height:140,
                      child: Column(
                          children: [FeaturesTile(
                              icon: Icon(Icons.fact_check, color: Color(0xff5A6C64)),
                              label: "État"),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              widget.confirmed,
                              style: TextStyle(
                                  color: (widget.confirmed =="confirmée") ?Colors.green:Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )]),
                    ),
                    SizedBox(
                       width:120,height:140,
                      child: Column(

                          children: [FeaturesTile(
                            icon: Icon(Icons.wallet_travel_rounded, color: Color(0xff5A6C64)),
                            label: "Partenaire/Éditeur",
                          ),SizedBox(
                            height: 10,
                          ),

                                 Text(
                                widget.partenaire,
                                style: TextStyle(
                                    color: Colors.black54 ,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                            ]),
                    )


                  ],
                ),

              SizedBox(
                height: 20,
              ),

              DetailsCard(formateur: widget.formateur)

              ,
              SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                padding: const EdgeInsets.all(5),
               child: Column(
                    children:[
                    Text("Description et details de la formation",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                   fontSize: 30,
                   fontWeight: FontWeight.bold,
                   color: Color(0xff5A6C64)),
               )
                  ,Html(
                    data: widget.content,
                    style: {
                      "body": Style(
                          fontSize: FontSize(18.0),
                          fontWeight: FontWeight.w600,
                          color: Color(0xff879D95)),
                    }
                )
              ])),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  final String formateur;

  DetailsCard({this.formateur});

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        width: 350,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xffE9F4F9), borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment:MainAxisAlignment.start ,
                children: [
                  Image.asset(
                    "images/graduatecap2.png",
                    height: 50,
                  ),
                  SizedBox(width: 10,),
                  Text(
                    "Profil du formateur :",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff5A6C64)),
                  )
                ],


              ),

              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text(
                      formateur,
                      textAlign: TextAlign.start,
                      //softWrap: true,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff879D95)),
                    ),
                    ]),
              ),

            ],
          ),
        ),
      );

  }
}

class FeaturesTile extends StatelessWidget {
  final Icon icon;
  final String label;
  FeaturesTile({this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff5A6C64).withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(40)),
              child: icon,
            ),
            SizedBox(
              height: 9,
            ),
            Container(
                width: 70,
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff5A6C64)),
                ))
          ],
        ),
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final int rating;
  RatingBar(this.rating);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: rating >= 1 ? Colors.white70 : Colors.white30,
            ),
            SizedBox(
              width: 3,
            ),
            Icon(
              Icons.star,
              color: rating >= 2 ? Colors.white70 : Colors.white30,
            ),
            SizedBox(
              width: 3,
            ),
            Icon(
              Icons.star,
              color: rating >= 3 ? Colors.white70 : Colors.white30,
            ),
            SizedBox(
              width: 3,
            ),
            Icon(
              Icons.star,
              color: rating >= 4 ? Colors.white70 : Colors.white30,
            ),
            SizedBox(
              width: 3,
            ),
            Icon(
              Icons.star,
              color: rating >= 5 ? Colors.white70 : Colors.white30,
            ),
          ],
        ));
  }


}
