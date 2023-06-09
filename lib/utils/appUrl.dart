
class AppUrl
{


  static String baserl='http://api.alquran.cloud/v1';
  static String surahendpoint = baserl+'/surah';

  static String juzEndPoint(int paraNumber )
  {
     String juzUrl=baserl+"/juz/$paraNumber/quran-uthmani";
    return  juzUrl;
  }

}
