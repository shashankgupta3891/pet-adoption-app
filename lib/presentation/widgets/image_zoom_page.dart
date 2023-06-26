// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageZoomPage extends StatelessWidget {
  final ImageProvider imageProvider;
  final Color bgColor;

  const ImageZoomPage({
    Key? key,
    required this.imageProvider,
    this.bgColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zoomed Image'),
      ),
      body: PhotoView(
        backgroundDecoration: BoxDecoration(color: bgColor),
        imageProvider: imageProvider,
        initialScale: PhotoViewComputedScale.contained,
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered * 2,
      ),
    );
  }
}
