class Statistics {
  String viewCount;
  String likeCount;
  String dislikeCount;
  String favoriteCount;
  String commentCount;

  Statistics({viewCount, likeCount, dislikeCount, favoriteCount, commentCount});

  Statistics.fromJson(Map<String, dynamic> json) {
    viewCount = json['viewCount'];
    likeCount = json['likeCount'];
    dislikeCount = json['dislikeCount'];
    favoriteCount = json['favoriteCount'];
    commentCount = json['commentCount'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['viewCount'] = viewCount;
    data['likeCount'] = likeCount;
    data['dislikeCount'] = dislikeCount;
    data['favoriteCount'] = favoriteCount;
    data['commentCount'] = commentCount;
    return data;
  }
}
