import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:network_image/model/photo_model.dart';
import '../service/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Photo> photos = [];

  void _apiGetPhotos() {
    HttpService.GET(HttpService.API_PHOTO_LIST, HttpService.paramEmpty())
        .then((response) {
      if (response != null) {
        // photos = List<Photo>.from(
        //     jsonDecode(response).map((e) => Photo.fromJson(e)));

        showPhoto(response);
      }
    });
  }

  void showPhoto(String photo) {
    PhotoList photoList = HttpService.parsePhotoList(photo);
    setState(() {
      photos = photoList.photoList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiGetPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: photos.length,
          itemBuilder: (context, index) => itemBuild(photos[index])),
    );
  }

  Widget itemBuild(Photo photo) {
    return Padding(
      padding: EdgeInsets.all(13),
      child: Container(
        height: 50,
        child: CachedNetworkImage(
          imageUrl: photo.thumbnailUrl!,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
