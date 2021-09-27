
import 'package:flutter/material.dart';




class ReservationScreen extends StatefulWidget {
  ReservationScreen({Key key}) : super(key: key);


  @override
  _ReservationScreen createState() => _ReservationScreen();
}

class _ReservationScreen extends State<ReservationScreen> {
  int _value = 1;
  int group =1;
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
                children:[
                  Image.asset('images/2.png',
                      height: 220
                  ),

                ]

            ),
            Text(
              'Inscrivez-vous maintenant!',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text('',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:
                      [
                        Expanded(
                          child: Row(
                            children: [
                              Radio(
                                value:1,
                                groupValue:  group ,
                                onChanged: (T)
                                {
                                  setState((){
                                    group =T;
                                  }) ;
                                },

                              ),
                              Text('Professionel'),

                            ],

                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [

                              Radio(
                                value:2,
                                groupValue:group,
                                onChanged:   (T)
                                {
                                  setState((){
                                    group =T;
                                  }) ;
                                },
                              ), Text('Particulier'),

                            ],
                          ),
                        ),
                      ],
                    ),
                    Material(
                      elevation: 60.0,
                      shadowColor: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(

                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Nom Complet',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                        ),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Material(
                      elevation: 60.0,
                      shadowColor: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(

                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                        ),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Material(
                      elevation: 60.0,
                      shadowColor: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(

                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Numéro de téléphone',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                        ),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Material(
                      elevation: 60.0,
                      shadowColor: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(

                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Nom de l'entreprise",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                        ),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Material(
                      elevation: 60.0,
                      shadowColor: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(

                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Nombre d'inscrits",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                        ),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                   ,
                    SizedBox(
                      height: 10,
                    ),


                    Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60)),
                      child: ElevatedButton(
                        style:ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.blue)
                              )
                          ),
                        ),



                        onPressed: () {
                          if (formkey.currentState.validate()) {

                          }
                        },
                        child: Text(
                          'Envoyer',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    ),




                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
