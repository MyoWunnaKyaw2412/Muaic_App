class Song {
  late String song_url;
  late String artist;
  String? artwork;
  late String name;

  Song(
      {required this.song_url,
      required this.artist,
      this.artwork,
      required this.name});
}
