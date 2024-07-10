import 'dart:convert';

class PostModel {
  String? images;
  String? content;
  String? authorName;
  PostModel({
    this.images,
    this.content,
    this.authorName,
  });

  PostModel copyWith({
    String? images,
    String? content,
    String? authorName,
  }) {
    return PostModel(
      images: images ?? this.images,
      content: content ?? this.content,
      authorName: authorName ?? this.authorName,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(images != null){
      result.addAll({'images': images});
    }
    if(content != null){
      result.addAll({'content': content});
    }
    if(authorName != null){
      result.addAll({'author_name': authorName});
    }
  
    return result;
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      images: map['images'],
      content: map['content'],
      authorName: map['authorName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) => PostModel.fromMap(json.decode(source));

  @override
  String toString() => 'PostModel(images: $images, content: $content, authorName: $authorName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PostModel &&
      other.images == images &&
      other.content == content &&
      other.authorName == authorName;
  }

  @override
  int get hashCode => images.hashCode ^ content.hashCode ^ authorName.hashCode;
}
