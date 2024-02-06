class Photo {
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Photo({
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl
  });

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}
