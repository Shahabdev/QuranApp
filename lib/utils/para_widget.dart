import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quranproject/modals/JuzModal.dart';
import 'package:quranproject/reprository/juzs_repository.dart';
import 'package:quranproject/view_model/JuzViewModal.dart';

import '../data/response/status.dart';

class ParaWidget extends StatelessWidget {
  const ParaWidget({super.key});

  Future<List<Map>> loadJson() async {
    List<Map> _listjson;
    String data = await rootBundle.loadString("assets/juz_indexes.json");
    print("ubaid -------------------------/:$data");
    final jsonResult = jsonDecode(data);
    print("munsif :$data");
    return _listjson = jsonResult["data"];
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<JuzViewModal>();
    return FutureBuilder(
        future: loadJson(),
        builder: (BuildContext context, AsyncSnapshot<List<Map>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                final list = snapshot.data;
                return ListView.builder(
                  itemCount: list!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.asset(
                        "assets/counting.png",
                        scale: 1.0,
                      ),
                      title: Text(
                        snapshot.data![index]["englishName"],
                        style:
                            TextStyle(color: Color(0xff240F4F), fontSize: 20),
                      ),
                      subtitle: Text(
                        " MECCAN \t \tألْفَاتِحَة 7 VERSES",
                        style:
                            TextStyle(color: Color(0xff8789A3), fontSize: 12),
                      ),
                      trailing: Text(
                        " ألْفَاتِحَة",
                        style:
                            TextStyle(color: Color(0xff863ED5), fontSize: 20),
                      ),
                    );
                  },
                );
              } else {
                print("munsif :${snapshot.data}");
                return Text("No data available");
              }
            default:
              return CircularProgressIndicator();
          }
        });
  }
}
