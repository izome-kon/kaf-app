import 'package:kaf/models/user_model.dart';

class PostModel {
   User user;
   String text;
   String imageUrl;
   String time; 
   String location;

  PostModel(this.user,this.text,this.imageUrl,this.time,this.location);
}