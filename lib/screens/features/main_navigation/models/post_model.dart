class PostModel {
  final String description;
  final String fileUrl;
  final int likes;
  final int comments;
  final String creatorUid;
  final String creator;
  final int createdAt;

  PostModel({
    required this.fileUrl,
    required this.creator,
    required this.description,
    required this.likes,
    required this.comments,
    required this.creatorUid,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "creator": creator,
      "description": description,
      "fileUrl": fileUrl,
      "likes": likes,
      "comments": comments,
      "creatorUid": creatorUid,
      "createdAt": createdAt,
    };
  }
}
