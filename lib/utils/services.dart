import 'dart:convert';
import 'dart:io';
import 'package:flutter_app_yotube/models/Video.dart';
import 'package:flutter_app_yotube/models/chanel_info.dart';
import 'package:flutter_app_yotube/utils/video_list.dart';
import 'package:http/http.dart' as http  ;

class Services{
  static String CHANEL_ID = 'UCFFbwnve3yF62-tVXkTyHqg';
  static String _baseUrl = 'youtube.googleapis.com';
  /*
  * curl \
  'https://youtube.googleapis.com/youtube/v3/channels?part=snippet%2CcontentDetails%2Cstatistics&id=UCFFbwnve3yF62-tVXkTyHqg&access_token=AIzaSyBSKuYPe0evyoSpsnwuz4JySm0EHhR2oMY&key=[YOUR_API_KEY]' \
  --header 'Authorization: Bearer [YOUR_ACCESS_TOKEN]' \
  --header 'Accept: application/json' \
  --compressed

  * */


  static Future<List<Video>> getVideolInfo(String playListId,String pageToken) async{
    Map <String,String> parameters = {
      'part':'snippet',
      'playlistId':'PLWS2mFp_C6rPXhBwR7ZpwYTjlR8HNGJGh',
      'maxResults':'2',
      'key' : 'AIzaSyBSKuYPe0evyoSpsnwuz4JySm0EHhR2oMY'
    };
    Map <String,String> headers = {
      HttpHeaders.contentTypeHeader : 'application/json'
    };
    Uri uri = Uri.https(_baseUrl, 'youtube.googleapis.com/youtube/v3/playlistItems',parameters);
    http.Response response=
    //await http.get('https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLPEoPvtzSAdw4dh2T9OmpsYCZQODJ7MQn&access_token=AIzaSyBSKuYPe0evyoSpsnwuz4JySm0EHhR2oMY&key=AIzaSyBSKuYPe0evyoSpsnwuz4JySm0EHhR2oMY');
    await http.get('https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&&maxResults=50&playlistId=PLOvTrsxvbVsp4JwbkbMbm-nsaAUSrgCrL&access_token=AIzaSyBSKuYPe0evyoSpsnwuz4JySm0EHhR2oMY&key=AIzaSyBSKuYPe0evyoSpsnwuz4JySm0EHhR2oMY');

    var jsonData = json.decode(response.body);
    List <Video> videoes = [];
    for(var u in jsonData['items']){
      print(u['snippet']['title']);
      videoes.add(Video(u['snippet']['title'],u['snippet']['thumbnails']['default']['url'],u['snippet']['resourceId']['videoId']));
    }
    return videoes;
  }

}