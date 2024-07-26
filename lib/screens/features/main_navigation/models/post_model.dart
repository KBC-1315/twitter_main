class PostModel {
  final String description;
  List<String> fileUrl;
  final int likes;
  final int comments;
  final String creatorUid;
  final String creator;
  final int createdAt;
  final String postType;

  PostModel({
    required this.fileUrl,
    required this.creator,
    required this.description,
    required this.likes,
    required this.comments,
    required this.creatorUid,
    required this.createdAt,
    required this.postType,
  });

  PostModel.fromJson(Map<String, dynamic> json)
      : creator = json["creator"],
        description = json["description"],
        fileUrl = List<String>.from(json["fileUrl"]),
        likes = json["likes"],
        comments = json["comments"],
        creatorUid = json["creatorUid"],
        createdAt = json["createdAt"],
        postType = json["postType"];
  Map<String, dynamic> toJson() {
    return {
      "creator": creator,
      "description": description,
      "fileUrl": fileUrl,
      "likes": likes,
      "comments": comments,
      "creatorUid": creatorUid,
      "createdAt": createdAt,
      "postType": postType,
    };
  }
}
