

import 'package:flutter/material.dart';
import 'package:quranproject/data/network/BaseApiServices.dart';
import 'package:quranproject/data/network/networkApiServises.dart';

import '../modals/JuzModal.dart';
import '../utils/appUrl.dart';

class JuzRepository {
  BaseApiServices _apiServices=NetworkApiServices();
  Future<JuzModal> JuzName(int paraNum) async
  {
    try
        {
          dynamic response =await _apiServices.getApiResponse(AppUrl.juzEndPoint(paraNum));
          print('shahab${response}');
          return response=JuzModal.fromJson(response);
        }
        catch(e)
    {
      print('juzrepository $e');
      throw(e);
    }
  }
}