// ignore_for_file: file_names, non_constant_identifier_names, duplicate_ignore

List<MusicDetails>VideoList = [];

List<String>playlistName = [];

List<MusicDetails> SelectedVideos = [];

// ignore: non_constant_identifier_names
List<dynamic>PlayListsArray = [];


class MusicDetails {
  String Name;
  String? Path;
  bool isLiked = false;

  MusicDetails({required this.Name, required this.Path});
}

List<MusicDetails>LikedVideos = [];




void changeFevriotStatus(int index) {
  // ignore: avoid_print
  print(VideoList[index].isLiked);
  if (VideoList[index].isLiked == false) {
    VideoList[index].isLiked = true;
    LikedVideos.add(VideoList[index]);
  }
  else if (VideoList[index].isLiked == true) {
    VideoList[index].isLiked = false;
   for(int i=0;i<LikedVideos.length;i++){
     if(LikedVideos[i].Path==VideoList[index].Path){
       LikedVideos.removeAt(i);
       break;
     }
   }
  }
}




