import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({
    super.key,
    required this.total,
    required this.pages,
    required this.currentPage,
    required this.listLength,
    required this.status,
    required this.onPressed,
  });

  final int total;
  final int pages;
  final int currentPage;
  final int listLength;
  final bool status;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Text(
              'Pagine: $currentPage/$pages - $listLength/$total',
              softWrap: false,
              overflow: TextOverflow.fade,
            ),
          ),
          // Reload
          Container(
            height: 32.0,
            width: 32.0,
            margin: const EdgeInsets.only(left: 8.0),
            child:
                status
                    ? CircleAvatar(
                      child: Center(
                        child: SizedBox.square(
                          dimension: 16.0,
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      ),
                    )
                    : IconButton.filled(
                      onPressed: onPressed,
                      iconSize: 16.0,
                      icon: Icon(Icons.refresh_outlined),
                    ),
          ),
        ],
      ),
    );
  }
}
