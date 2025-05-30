import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maga/feature/image/model/image_model.dart';

class CategImage extends StatelessWidget {
  const CategImage({
    super.key,
    required this.src,
    required this.width,
    required this.height,
    this.imageModel,
    this.isMiniature,
  });

  final String? src;
  final double width;
  final double height;
  final ImageModel? imageModel;
  final bool? isMiniature;

  @override
  Widget build(BuildContext context) {
    // Image SRC
    String? imageSrc =
        (src == null || src!.isEmpty) ||
                (imageModel != null &&
                    imageModel!.guid.rendered.contains(
                      'woocommerce-placeholder',
                    ))
            ? 'https://grosmichel.it/wp-content/uploads/woocommerce-placeholder.png'
            : '$src';

    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(isMiniature != null && isMiniature! ? 0.0 : 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: Offset(0.0, 0.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      child:
          imageModel != null && imageModel?.mimeType == 'image/svg+xml'
              ? Center(child: Text('SVG'))
              : CachedNetworkImage(
                fit: BoxFit.cover,
                filterQuality:
                    (isMiniature != null && isMiniature!)
                        ? FilterQuality.low
                        : FilterQuality.high,
                imageUrl: imageSrc,
                progressIndicatorBuilder:
                    (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ),
                    ),
                errorWidget:
                    (context, url, error) => Center(
                      child: IconButton(
                        onPressed: () {
                          log('Error Image [${imageModel?.id}]:  $error');
                        },
                        icon: Icon(Icons.error),
                      ),
                    ),
              ),
    );
  }
}
