class PhotoList{
  late List<Photo> photoList;

  PhotoList({required this.photoList});

  PhotoList.fromJson(List json){
    photoList=json.map((e) => Photo.fromJson(e)).toList();
  }

  List toJson(){
    List list;
    list=photoList.map((e) => e.toJson()).toList();
    return list;
  }
}

class Photo {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Photo(
      { this.albumId,
       this.id,
       this.title,
       this.url,
       this.thumbnailUrl});


  Photo.fromJson(Map<String, dynamic> json)
      : albumId = json["albumId"],
        id = json["id"],
        title = json["title"],
        url = json["url"],
        thumbnailUrl = json["thumbnailUrl"];

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
