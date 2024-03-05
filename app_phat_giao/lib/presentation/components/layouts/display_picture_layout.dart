import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class DisplayPictureLayout extends StatelessWidget {
  const DisplayPictureLayout({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.close,
                color: Colors.white,
                size: 24,
              ))
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: PhotoView(
          imageProvider: CachedNetworkImageProvider(url),
        ),
      ),
    );
  }
}
