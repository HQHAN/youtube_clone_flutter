class Video {
  String kind;
  String etag;
  String nextPageToken;
  String regionCode;
  PageInfo pageInfo;
  List<Items> items;

  Video({kind, etag, nextPageToken, regionCode, pageInfo, items});

  Video.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    etag = json['etag'];
    nextPageToken = json['nextPageToken'];
    regionCode = json['regionCode'];
    pageInfo =
        json['pageInfo'] != null ? PageInfo.fromJson(json['pageInfo']) : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['kind'] = kind;
    data['etag'] = etag;
    data['nextPageToken'] = nextPageToken;
    data['regionCode'] = regionCode;
    if (pageInfo != null) {
      data['pageInfo'] = pageInfo.toJson();
    }
    if (items != null) {
      data['items'] = items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PageInfo {
  int totalResults;
  int resultsPerPage;

  PageInfo({totalResults, resultsPerPage});

  PageInfo.fromJson(Map<String, dynamic> json) {
    totalResults = json['totalResults'];
    resultsPerPage = json['resultsPerPage'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['totalResults'] = totalResults;
    data['resultsPerPage'] = resultsPerPage;
    return data;
  }
}

class Items {
  String kind;
  String etag;
  Id id;
  Snippet snippet;

  Items({kind, etag, id, snippet});

  Items.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    etag = json['etag'];
    id = json['id'] != null ? Id.fromJson(json['id']) : null;
    snippet =
        json['snippet'] != null ? Snippet.fromJson(json['snippet']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['kind'] = kind;
    data['etag'] = etag;
    if (id != null) {
      data['id'] = id.toJson();
    }
    if (snippet != null) {
      data['snippet'] = snippet.toJson();
    }
    return data;
  }
}

class Id {
  String kind;
  String videoId;

  Id({kind, videoId});

  Id.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    videoId = json['videoId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['kind'] = kind;
    data['videoId'] = videoId;
    return data;
  }
}

class Snippet {
  String publishedAt;
  String channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  String channelTitle;
  String liveBroadcastContent;
  String publishTime;

  Snippet(
      {publishedAt,
      channelId,
      title,
      description,
      thumbnails,
      channelTitle,
      liveBroadcastContent,
      publishTime});

  Snippet.fromJson(Map<String, dynamic> json) {
    publishedAt = json['publishedAt'];
    channelId = json['channelId'];
    title = json['title'];
    description = json['description'];
    thumbnails = json['thumbnails'] != null
        ? Thumbnails.fromJson(json['thumbnails'])
        : null;
    channelTitle = json['channelTitle'];
    liveBroadcastContent = json['liveBroadcastContent'];
    publishTime = json['publishTime'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['publishedAt'] = publishedAt;
    data['channelId'] = channelId;
    data['title'] = title;
    data['description'] = description;
    if (thumbnails != null) {
      data['thumbnails'] = thumbnails.toJson();
    }
    data['channelTitle'] = channelTitle;
    data['liveBroadcastContent'] = liveBroadcastContent;
    data['publishTime'] = publishTime;
    return data;
  }
}

class Thumbnails {
  Default defalt;
  Default medium;
  Default high;

  Thumbnails({defalt, medium, high});

  Thumbnails.fromJson(Map<String, dynamic> json) {
    defalt = json['defalt'] != null ? Default.fromJson(json['defalt']) : null;
    medium = json['medium'] != null ? Default.fromJson(json['medium']) : null;
    high = json['high'] != null ? Default.fromJson(json['high']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (defalt != null) {
      data['defalt'] = defalt.toJson();
    }
    if (medium != null) {
      data['medium'] = medium.toJson();
    }
    if (high != null) {
      data['high'] = high.toJson();
    }
    return data;
  }
}

class Default {
  String url;
  int width;
  int height;

  Default({url, width, height});

  Default.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}
