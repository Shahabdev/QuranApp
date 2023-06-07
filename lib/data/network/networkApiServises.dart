import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart%20';
import 'package:quranproject/data/network/BaseApiServices.dart';
import 'package:http/http.dart 'as http;
import 'package:quranproject/data/app_exception.dart';
import 'package:quranproject/modals/SurahNameModal.dart';

class NetworkApiServices extends BaseApiServices
{
  @override
  Future getApiResponse(String url) async{
     dynamic responseJson;
      try
          {
            final response=await http.get(Uri.parse(url));

            responseJson=returnResponse(response);
          } on SocketException
     {
       print('postApiresponse $SocketException');
       throw FetchDataException('error during communication');
     }
      return responseJson;
  }

  @override
  Future postApiResponse(String url, data) async{

     dynamic responseJson;
     try
         {
           Response response=await post(Uri.parse(url),body: data).timeout(Duration(seconds: 5));
           responseJson=returnResponse(response);
         } on SocketException
     {

       throw FetchDataException('error during communication');
     }
    return responseJson;
  }
  dynamic returnResponse(http.Response response)
  {
    switch(response.statusCode)
        {
      case 200:
        
         dynamic responseJson=jsonDecode(response.body) ;
         return responseJson;
        //  return SurahNameModal.fromJson(responseJson);
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException('Error accured while communicating with server'+
            'with status code' +response.statusCode.toString());

    }
  }



}