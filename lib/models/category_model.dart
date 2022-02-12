class Category{
   final String id;
  final String title;
  final String imageUrl;
  const Category({
    required this.id,
    required this.title,
    required this.imageUrl
});

 /* Category.fromJson(Map<String,dynamic>json){
    id = json['id'];
    title = json['title'];
    imageUrl = json['imageUrl'];
  }*/
}