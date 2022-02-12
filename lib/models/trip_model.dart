enum Season{
  Winter,
  Spring,
  Summer,
  Autumn,
}
enum TripType{
  Recovery,
  Exploration,
  Activities,
  Therapy
}

class Trip{
  String id;
  List<String> categories;
  String title;
  String imageUrl;
  List<String> program;
  List<String> activities;
  int duration;
  Season season;
  TripType tripType;
  bool isInSummer;
  bool isInWinter;
  bool isForFamilies;
  Trip({
    required this.id,
    required this.tripType,
    required this.season,
    required this.imageUrl,
    required this.title,
    required this.activities,
    required this.categories,
    required this.duration,
    required this.isForFamilies,
    required this.isInSummer,
    required this.isInWinter,
    required this.program,



});
}