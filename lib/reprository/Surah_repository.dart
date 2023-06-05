import 'dart:convert';
import 'dart:io';

import 'package:quranproject/data/network/BaseApiServices.dart';
import 'package:quranproject/data/network/networkApiServises.dart';
import 'package:quranproject/modals/SurahNameModal.dart';
import 'package:quranproject/utils/appUrl.dart';

class SurahRepository {
  BaseApiServices _apiServices = NetworkApiServices();
  Future<SurahNameModal> surahName() async {
    try {
      dynamic response = await _apiServices.getApiResponse(AppUrl.baserl);

      print('shahab${response}');
      //var data = jsonDecode(response.body.toString());


      return response= SurahNameModal.fromJson(response);

    } catch (error) {
      print('surahrepository $error');
      throw (error);
    }
  }
}
