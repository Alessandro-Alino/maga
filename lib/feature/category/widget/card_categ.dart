import 'package:flutter/material.dart';
import 'package:maga/feature/category/model/category.dart';
import 'package:maga/feature/category/widget/categ_image.dart';
import 'package:maga/feature/category/widget/popup_menu_categ.dart';

// Standard Card Categ
class CardCateg extends StatefulWidget {
  const CardCateg({
    super.key,
    required this.categ,
    required this.subtitle,
    this.trailing,
  });

  final CategModel categ;
  final String subtitle;
  final Widget? trailing;

  @override
  State<CardCateg> createState() => _CardCategState();
}

class _CardCategState extends State<CardCateg> {
  final ValueNotifier<CategModel?> _hover = ValueNotifier<CategModel?>(null);

  @override
  void dispose() {
    _hover.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _hover,
      builder: (context, value, child) {
        return InkWell(
          onTap: () {},
          onHover: (e) {
            if (e) {
              _hover.value = widget.categ;
            } else {
              _hover.value = null;
            }
          },
          borderRadius: BorderRadius.circular(16.0),
          child: Card(
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              leading: CategImage(
                src: widget.categ.image?.src,
                width: 50.0,
                height: 50.0,
                isMiniature: true,
              ),
              title: Text(
                widget.categ.name,
                softWrap: false,
                overflow: TextOverflow.fade,
              ),
              subtitle: Text(
                widget.subtitle,
                softWrap: false,
                overflow: TextOverflow.fade,
              ),
              trailing: AnimatedOpacity(
                duration: Durations.short1,
                opacity: _hover.value == widget.categ ? 1.0 : 0.0,
                child: PopupMenuCategory(category: widget.categ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// Card Categ for Removed Animation
class CardCategRemoved extends StatelessWidget {
  const CardCategRemoved({
    super.key,
    required this.animation,
    required this.category,
  });

  final Animation<double> animation;
  final CategModel category;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation.drive(
        TweenSequence<Offset>([
          TweenSequenceItem(
            tween: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ),
            weight: 20,
          ),
          TweenSequenceItem(
            tween: ConstantTween<Offset>(const Offset(0.0, 0.0)),
            weight: 80,
          ),
        ]),
      ),
      child: Card(
        color: Colors.redAccent.shade200,
        child: ListTile(
          leading: Icon(
            Icons.delete_forever_outlined,
            color: Colors.white,
            size: 45.0,
          ),
          title: Text(
            category.name,
            softWrap: false,
            overflow: TextOverflow.fade,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          subtitle: Text('Eliminato'),
          subtitleTextStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
