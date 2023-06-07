import 'package:flutter/material.dart';
import 'package:quranproject/data/response/Apiresponse.dart';
import 'package:quranproject/reprository/JuzRepository.dart';

import '../modals/JuzModal.dart';

class JuzViewModal with ChangeNotifier{
  final _myRepo=JuzRepository();
   List<JuzModal> _allJuz=[];

   List<JuzModal> get getAllJuz=>_allJuz;

  void addJuz(JuzModal juz){
    // allJuz.add(juz);
    _allJuz.add(juz);
    print("${_allJuz.length}");
    notifyListeners();
  }

  void loadAllJuz()async{
    for(int i=1; i<=30;i++){
    final JuzModal juzModal= await  getJuzName(i);
    addJuz(juzModal);
    notifyListeners();
    }
  }
  ApiResponse<JuzModal> juzNameList=ApiResponse.loading();
  setJuzName(ApiResponse<JuzModal> response)
  {
    juzNameList=response;
    notifyListeners();
  }

  Future<JuzModal> getJuzName(int paraNum) async
  {
    late final JuzModal juzModal;
    setJuzName(ApiResponse.loading());
  await  _myRepo.JuzName(paraNum).then((value)
    {
      setJuzName(ApiResponse.completed(value));
      juzModal= value;
    }).onError((error, stackTrace)
    {
      print(stackTrace);
      setJuzName(ApiResponse.error(error.toString()));
      throw Exception("Something went wrong");
    });
    return juzModal;
  }
}