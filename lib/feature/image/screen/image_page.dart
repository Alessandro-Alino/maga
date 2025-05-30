import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maga/feature/image/bloc/image_bloc.dart';
import 'package:maga/feature/image/widget/image_grid.dart';
import 'package:maga/feature/image/widget/search_image_by_id.dart';
import 'package:maga/feature/image/widget/upload_image.dart';

@RoutePage()
class ImagePage extends StatelessWidget {
  const ImagePage({super.key, @PathParam('id') this.id});

  final int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
        actions: [
          IconButton(onPressed: () {
            context.read<ImageBloc>().getImages();
          }, icon: const Icon(Icons.refresh)),
          // Modal to search one image
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                enableDrag: true,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return SearchImageByID();
                },
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(children: [Expanded(child: ImageGrid())]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            enableDrag: true,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return UploadImage();
            },
          );
        },
        icon: Icon(Icons.upload),
        label: const Text('Upload'),
      ),
    );
  }
}
