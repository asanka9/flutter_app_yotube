import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_app_yotube/models/chanel_info.dart';
import 'package:flutter_app_yotube/otherapps.dart';
import 'package:flutter_app_yotube/utils/services.dart';
import 'package:flutter_app_yotube/utils/video_list.dart';
import 'package:flutter_native_admob/native_admob_options.dart';
import 'home.dart';
import 'dart:async';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  BannerAd _bannerAd;
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo();
  final _nativeAdController = NativeAdmobController();
  int _selectedIndex;
  int _selectedSubject;
  int _selectedVideoIndex;


  InterstitialAd fullAdd(){
    return InterstitialAd(
        targetingInfo: targetingInfo,
        adUnitId: InterstitialAd.testAdUnitId,
        listener: (MobileAdEvent event) {
          print('interstitial event: $event');
        })..load();
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-7201976257696418~8377848588');
    //_bannerAd = createBannerAdd()..load();
  }
  

  lesson_videoes(double _width,double _hieght){
    return FutureBuilder(
      future: Services.getVideolInfo('playListId', 'pageToken'),
      builder: (BuildContext context,AsyncSnapshot snapshot){
        if(snapshot.data == null){
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }else{
          return ListView.separated(
              itemBuilder: (context,index){
                return _selectedVideoIndex!=index? InkWell(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, _hieght*0.001, 0, _hieght*0.001),
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(_width*0.043),
                        child: Row(
                          children: [
                            Image.network(
                              snapshot.data[index].description,
                              fit: BoxFit.cover,
                              width: _width*0.45,
                              height: _width*0.28,
                            ),
                            SizedBox(
                              width: _width*0.026,
                            ),
                            Flexible(child: Text(
                              snapshot.data[index].title,
                              style: TextStyle(
                                  fontSize: _width*0.041
                              ),
                            )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  onTap: (){
                    setState(() {
                      _selectedVideoIndex = index;
                    });
                  },
                ):Text('data');
              },
              separatorBuilder: (context,index){
                return index % 4 == 0
                    ? Container(
                    margin: EdgeInsets.all(_width*0.04),
                    height: _hieght*0.2,
                    color: Colors.white,
                    child: NativeAdmob(
                      adUnitID: NativeAd.testAdUnitId,
                      options: NativeAdmobOptions(
                        showMediaContent: false,

                      ),
                      controller: _nativeAdController,
                      type: NativeAdmobType.full,
                      loading: Center(child: CircularProgressIndicator()),
                      error: Text('failed to load'),
                    ))
                    : Container(
                  width: 12,
                  height: 12,
                );
              },
              itemCount: snapshot.data.length);
        }
      },
    );
  }

  getSubjectColor(int num){
    switch(num){
      case 0:
        return Colors.green;
        break;
      case 1:
        return Colors.blue;
        break;
      case 2:
        return Colors.red;
        break;
      default:
        return Colors.amber;
    }
  }




  List subs = [
    [
      {
        'lesson':'LESSON 01',
        'playlistid':'as-32323-2323'
      },
      {
        'lesson':'LESSON 0222222222222222222222222222222222222222222222222',
        'playlistid':'as-32323-2323'
      },
      {
        'lesson':'LESSON 02',
        'playlistid':'as-32323-2323'
      },
      {
        'lesson':'LESSON 01',
        'playlistid':'as-32323-2323'
      },
      {
        'lesson':'LESSON 0222222222222222222222222222222222222222222222222',
        'playlistid':'as-32323-2323'
      },
      {
        'lesson':'LESSON 02',
        'playlistid':'as-32323-2323'
      },
      {
        'lesson':'LESSON 01',
        'playlistid':'as-32323-2323'
      },
      {
        'lesson':'LESSON 0222222222222222222222222222222222222222222222222',
        'playlistid':'as-32323-2323'
      },
      {
        'lesson':'LESSON 02',
        'playlistid':'as-32323-2323'
      },
      {
        'lesson':'LESSON 01',
        'playlistid':'as-32323-2323'
      },
      {
        'lesson':'LESSON 0222222222222222222222222222222222222222222222222',
        'playlistid':'as-32323-2323'
      },
      {
        'lesson':'LESSON 02',
        'playlistid':'as-32323-2323'
      },
    ],

    [
      {
        'lesson':'පදාර්ඨ්යේ ගුණ',
        'playlistid':'as-32323-2323'
      },
      {
        'lesson':'LESSON 0222222222222222222222222222222222222222222222222',
        'playlistid':'as-32323-2323'
      },
      {
        'lesson':'LESSON 02',
        'playlistid':'as-32323-2323'
      },
      {
        'lesson':'LESSON 01',
        'playlistid':'as-32323-2323'
      },
      {
        'lesson':'LESSON 0222222222222222222222222222222222222222222222222',
        'playlistid':'as-32323-2323'
      },
      {
        'lesson':'LESSON 02',
        'playlistid':'as-32323-2323'
      },
      {
        'lesson':'LESSON 01',
        'playlistid':'as-32323-2323'
      },
      {
        'lesson':'LESSON 0222222222222222222222222222222222222222222222222',
        'playlistid':'as-32323-2323'
      },
      {
        'lesson':'LESSON 02',
        'playlistid':'as-32323-2323'
      },
      {
        'lesson':'LESSON 01',
        'playlistid':'as-32323-2323'
      },
      {
        'lesson':'LESSON 0222222222222222222222222222222222222222222222222',
        'playlistid':'as-32323-2323'
      },
      {
        'lesson':'LESSON 02',
        'playlistid':'as-32323-2323'
      },
    ]
  ];



  Future<int> _getsubjectindex() async{
    final prefs = await SharedPreferences.getInstance();
    final startup_num = prefs.get("subIndex");
    if(startup_num==null){
      return 0;
    }else{
      return startup_num;
    }
  }

  Future<void> _setsubjectindex(int num) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("subIndex", num);
  }

  Future<int> _getlessonindex() async{
    final prefs = await SharedPreferences.getInstance();
    final startup_num = prefs.get("lessonIndex");
    if(startup_num==null){
      return 0;
    }else{
      return startup_num;
    }
  }

  Future<void> _setlessonindex(int num) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("lessonIndex", num);
  }

  Future<List> list_of_lessons() async{
    int sub_index = await _getsubjectindex();
    int lesson_index = await _getlessonindex();
    _selectedIndex = lesson_index;
    _selectedSubject = sub_index;

    return subs[sub_index];
  }

  lessonsview(double _width,double _hieght){
    return FutureBuilder(
      future: list_of_lessons(),
        builder: (context, snapshot) {
          if(snapshot.data==null){
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }else{
            return Container(

              padding: EdgeInsets.fromLTRB(_width*0.02, _width*0.02, _width*0.02, _width*0.02),
              child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(_width*0.04),
                            topRight: Radius.circular(_width*0.04)
                          ),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.fromLTRB(_width*0.02, _width*0.02, _width*0.02, _width*0.02),

                      child: ListTile(
                        leading: Container(
                          padding: EdgeInsets.fromLTRB(_width*0.028, _width*0.012, _width*0.028, _width*0.012),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(_width*0.042)),
                            color: getSubjectColor(_selectedSubject)[200],
                            border: Border.all(
                              width: 1,
                              color: getSubjectColor(_selectedSubject)
                            ),
                          ),
                          child: Text(
                            (index+1).toString() ,
                            style: TextStyle(
                              fontSize: _width*0.054,
                              color: Colors.black,
                            ),

                          ),
                        ),
                        title: Text(
                            snapshot.data[index]['lesson'],
                          style: TextStyle(
                          ),
                        ),
                        trailing: Icon(

                            (_selectedIndex % snapshot.data.length) == index? Icons.arrow_forward_ios_sharp:null,
                                color: getSubjectColor(_selectedSubject),
                        ),
                        onTap: (){
                          setState(() {
                            _selectedIndex = index;
                          });
                          _setlessonindex(index);
                        },
                      ),
                    );
                  },
              ),
            );
          }
        },
    );
  }



  @override
  void dispose() {
    // TODO: implement dispose
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //    return HomePage();

    /*
    *    Timer(Duration(seconds: 10), () {
      _bannerAd?.show();
    });
    *
    * */
    double _width = MediaQuery.of(context).size.width;
    double _hieght = MediaQuery.of(context).size.height;

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,

            actions:  <Widget>[
              PopupMenuButton(
                  itemBuilder: (BuildContext context){
                    return [
                      PopupMenuItem(
                          child: InkWell(
                              child: Row(
                                children: [
                                  Icon(Icons.apps),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: _width*0.03
                                    ),
                                      child: Text('Other Apps')
                                  )
                                ],
                              ),
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => OtherApps()));
                            },
                          )
                              
                      ),

                    ];
                  }
              )

            ],
            title: Text(
                'testapp',
              style: TextStyle(
                color: Colors.black

              ),

            ),
            iconTheme: IconThemeData(color: Colors.black),
            bottom: TabBar(
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wysiwyg_outlined,
                          color: Colors.blueGrey,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(_width*0.04, 0, 0, 0),
                          child: Text(
                              'Lessons',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: _width*0.047
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Tab(

                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_circle_outline,
                            color: Colors.blueGrey,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(_width*0.04, 0, 0, 0),
                            child: Text(
                                'Videoes',
                                style: TextStyle(

                                  color: Colors.blueGrey,
                                    fontSize: _width*0.047

                                ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ]
            )
            ,

          ),

          // APP : SCL APPS
          drawer: Drawer(
            child: Container(
              child: ListView(
                children: [
                  SizedBox(
                    height: _hieght*0.14,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(_width*0.04, _hieght*0.008, 0, _hieght*0.008),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(_width*0.04),
                          bottomLeft: Radius.circular(_width*0.04),
                          bottomRight: Radius.circular(0),
                          topRight: Radius.circular(0)
                      )
                    ),
                    child: ListTile(
                      title: Text(
                          'සං‍යුක්ත ගණිතය',
                        style: TextStyle(
                          fontSize: _width*0.047
                        ),

                      ),
                      trailing: _selectedSubject==0?Icon(
                          Icons.arrow_forward_ios_sharp,
                        color: getSubjectColor(_selectedSubject),
                      ):null,
                      onTap: (){
                        setState(() {
                          _selectedSubject =0;
                        });
                        fullAdd()?.show();
                        _setsubjectindex(0);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(_width*0.04, _hieght*0.008, 0, _hieght*0.008),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(_width*0.04),
                            bottomLeft: Radius.circular(_width*0.04),
                            bottomRight: Radius.circular(0),
                            topRight: Radius.circular(0)
                        )
                    ),
                    child: ListTile(
                      title: Text('ජීව විද්‍යාව',
                          style: TextStyle(
                          fontSize: _width*0.047
                      ),
                      ),
                      trailing: _selectedSubject==1?Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: getSubjectColor(_selectedSubject),

                    ):null,
                      onTap: (){
                        setState(() {
                          _selectedSubject =1;
                        });
                        fullAdd()?.show();
                        _setsubjectindex(1);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(_width*0.04, _hieght*0.008, 0, _hieght*0.008),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(_width*0.04),
                            bottomLeft: Radius.circular(_width*0.04),
                            bottomRight: Radius.circular(0),
                            topRight: Radius.circular(0)
                        )
                    ),
                    child: ListTile(
                      title: Text('භතික',
                        style: TextStyle(
                            fontSize: _width*0.047
                        ),
                      ),
                      trailing: _selectedSubject==2?Icon(
                          Icons.arrow_forward_ios_sharp,
                        color: getSubjectColor(_selectedSubject),

                      ):null,
                      onTap: (){
                        setState(() {
                          _selectedSubject =2;
                        });
                        fullAdd()?.show();
                        _setsubjectindex(2);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(_width*0.04, _hieght*0.008, 0, _hieght*0.008),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(_width*0.04),
                            bottomLeft: Radius.circular(_width*0.04),
                            bottomRight: Radius.circular(0),
                            topRight: Radius.circular(0)
                        )
                    ),
                    child: ListTile(
                      title: Text('රසායන',
                        style: TextStyle(
                            fontSize: _width*0.047
                        ),
                      ),
                      selectedTileColor: getSubjectColor(_selectedSubject),
                      trailing: _selectedSubject==3?Icon(
                          Icons.arrow_forward_ios_sharp,
                        color: getSubjectColor(_selectedSubject),
                      ):null,
                      onTap: (){
                        setState(() {
                          _selectedSubject =3;
                        });
                        fullAdd()?.show();
                        _setsubjectindex(3);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(_width*0.04, _hieght*0.008, 0, _hieght*0.008),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(_width*0.04),
                            bottomLeft: Radius.circular(_width*0.04),
                            bottomRight: Radius.circular(0),
                            topRight: Radius.circular(0)
                        )
                    ),
                    child: ListTile(
                      title: Text('තොරතුරු තාක්ශනය',
                        style: TextStyle(
                            fontSize: _width*0.047
                        ),
                      ),
                      trailing: _selectedSubject==4?Icon(
                          Icons.arrow_forward_ios_sharp,
                        color: getSubjectColor(_selectedSubject),

                      ):null,
                      onTap: (){
                        setState(() {
                          _selectedSubject =4;
                        });
                        fullAdd()?.show();
                        _setsubjectindex(4);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(_width*0.04, _hieght*0.008, 0, _hieght*0.008),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(_width*0.04),
                            bottomLeft: Radius.circular(_width*0.04),
                            bottomRight: Radius.circular(0),
                            topRight: Radius.circular(0)
                        )
                    ),
                    child: ListTile(
                      title: Text('කෘශිකර්මය',
                        style: TextStyle(
                            fontSize: _width*0.047
                        ),
                      ),
                      trailing: _selectedSubject==4?Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: getSubjectColor(_selectedSubject),

                      ):null,
                      onTap: (){
                        setState(() {
                          _selectedSubject =4;
                        });
                        fullAdd()?.show();
                        _setsubjectindex(4);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  SizedBox(
                    height: _hieght*0.19,
                  ),

                  Center(
                      child: Text(
                          'SCL APP @ V 1.0.0'
                      ),
                    ),

                ],
              ),
            ),
          ),
        body:TabBarView(
          children: [
            Container(
              child: lessonsview(_width,_hieght),
            ),
            Container(
              child: lesson_videoes(_width,_hieght),
            ),
          ],
        )
        ),
      ),
    );
  }
}


