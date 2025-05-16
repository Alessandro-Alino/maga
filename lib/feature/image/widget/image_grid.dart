import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maga/feature/category/widget/categ_image.dart';
import 'package:maga/feature/image/bloc/image_bloc.dart';
import 'package:maga/feature/image/model/image_model.dart';

class ImageGrid extends StatelessWidget {
  const ImageGrid({super.key, this.controller});

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    final double maxWidth = 1000.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            constraints: BoxConstraints(
              maxWidth:
                  constraints.maxWidth > maxWidth
                      ? maxWidth
                      : constraints.maxWidth,
            ),
            child: BlocBuilder<ImageBloc, ImageState>(
              builder: (context, state) {
                return GridView.builder(
                  controller: controller,
                  padding: const EdgeInsets.only(bottom: 80.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: min(
                      max(2, (constraints.maxWidth ~/ 150)),
                      6,
                    ),
                  ),
                  itemCount: state.fetchedImageList.length,
                  itemBuilder: (context, index) {
                    ImageModel image = state.fetchedImageList[index];
                    return GestureDetector(
                      onTap: (){
                        debugPrint('ID: ${image.id}');
                      },
                      onDoubleTap: () {
                        context.read<ImageBloc>().selectImages(image: image);
                        context.router.pop();
                      },
                      child: Stack(
                        children: [
                          // Categ Image
                          CategImage(
                            src: image.guid.rendered,
                            imageModel: image,
                            width: 150.0,
                            height: 150.0,
                          ),
                          // Check if selected
                          Visibility(
                            visible: state.selectedImage == image,
                            child: Positioned(
                              right: 14.0,
                              top: 14.0,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.green,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
