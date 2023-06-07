import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quranproject/modals/JuzModal.dart';
import 'package:quranproject/reprository/juzs_repository.dart';
import 'package:quranproject/view_model/JuzViewModal.dart';

class ParaWidget extends StatelessWidget {
  const ParaWidget({super.key});
  

  @override
  Widget build(BuildContext context) {
    final provider=context.watch<JuzViewModal>();
    return TextButton(onPressed: () {
      
    }, child: Text("${provider.getAllJuz.length}"),);
  }
}