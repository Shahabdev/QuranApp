import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quranproject/modals/SurahNameModal.dart';
import 'package:quranproject/utils/routes/routes_name.dart';
import 'package:http/http.dart' as http;
import 'package:quranproject/view_model/JuzViewModal.dart';
import '../data/network/networkApiServises.dart';
import '../reprository/Surah_repository.dart';
import '../view_model/surahName_viewModel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  NetworkApiServices networkApiServices=NetworkApiServices();

 // SurahRepository surahrepository=SurahRepository();
  SurahNameViewModal names = SurahNameViewModal();
  final JuzViewModal juzViewModal=JuzViewModal();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const  Column(
             // mainAxisAlignment: MainAxisAlignment.center,
             //  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Quran App",
                  style: TextStyle(
                      color: Color(0xff672CBC),
                      fontSize: 38,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Text(
                  "وَرَتِّلِ الْقُرْآن\n     تَرْتِيلً",
                  style: TextStyle(
                      color: Color(0xff8789A3),
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [

                RotationTransition(
                    turns: AlwaysStoppedAnimation(19/360),
                    child: Image.asset("assets/Frame 43.png",)),
                Positioned(
                top: 395,


                  child: InkWell(
                    onTap: ()
                    {
                     // detailsModel2('http://api.alquran.cloud/v1/surah');

                     // surahrepository.surahName();
        juzViewModal.loadAllJuz();
                      Navigator.pushNamed(context,RoutesName.homeScreen);
                      names.surahnamelist;



                    },
                    child: Container(
                      height: 60,
                      width:150,
                      decoration: BoxDecoration(
                        color: Color(0xffF9B091),
                        borderRadius: BorderRadius.circular(30),

                      ),
                      child: Center(
                        child: Text("Get Started",style: TextStyle(color: Colors.white,fontSize: 18),),
                      ),
                    ),
                  ),
                )
              ],


            ),

            // Image.asset("assets/pn2.svg")
          ],
        ),
      ),
    ));
  }
}
