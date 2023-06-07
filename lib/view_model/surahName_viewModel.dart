import 'package:flutter/cupertino.dart';
import 'package:quranproject/data/response/Apiresponse.dart';
import 'package:quranproject/reprository/Surah_repository.dart';

import '../modals/SurahNameModal.dart';

class SurahNameViewModal with ChangeNotifier
{
// bool _loading=false;
//  bool get loading=>_loading;
//  void setLoading(bool value)
//  {
//    _loading=value;
//    ChangeNotifier();
//  }

  final _myRepo=SurahRepository();

ApiResponse<SurahNameModal> surahnamelist=ApiResponse.loading();
setSurahName(ApiResponse<SurahNameModal> response)
{
  surahnamelist=response;
  notifyListeners();
}

  Future<void> getSurahInfo() async
  {
      setSurahName(ApiResponse.loading());
     _myRepo.surahName().then((value)
     {
        ///argument error
         setSurahName(ApiResponse.completed(value));

     }).onError((error, stackTrace)
     {
       setSurahName(ApiResponse.error(error.toString()));
     });

  }
}