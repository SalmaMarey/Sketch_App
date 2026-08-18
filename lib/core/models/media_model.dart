class MediaModel {
  final String id;
  final String url;

  MediaModel({required this.id, required this.url});

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
      id: json['id']?.toString() ?? '',
      url: json['imageUrl']?.toString() ?? json['url']?.toString() ?? '',
    );
  }

  String get fullImageUrl {
    return url;
  }
}
