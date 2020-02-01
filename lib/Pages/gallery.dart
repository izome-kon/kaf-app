import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';


class PhotoGallery1 extends StatelessWidget {
  PageController page ;
  PhotoGallery1(String s,iList)
  {
    imageList = iList;
    index = imageList.indexOf(s);
    this.page = new PageController(initialPage: index);
  }
  int index;
  List <String> imageList;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoViewGallery.builder(
          pageController: page,
          itemCount: imageList.length,
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(imageList[index],),
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 2,
            );
          },
          scrollPhysics: BouncingScrollPhysics(),
          loadingChild: Center(child: CircularProgressIndicator(),),
        )
    );
  }
}
