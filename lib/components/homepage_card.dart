import 'package:flutter/material.dart';

class HomePageCard extends StatefulWidget {
  String title;
  String text;
  String image;
  HomePageCard({
    Key? key,
    required this.title,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  State<HomePageCard> createState() => _HomePageCardState();
}

class _HomePageCardState extends State<HomePageCard> {
  bool changeScale = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: TextStyle(
              fontSize: 26, color: changeScale ? Colors.amber : Colors.white),
        ),
        MouseRegion(
          onEnter: (event) {
            setState(() {
              changeScale = true;
            });
          },
          onExit: (event) {
            setState(() {
              changeScale = false;
            });
          },
          child: AnimatedScale(
            curve: Curves.easeInOut,
            duration: const Duration(seconds: 1),
            scale: changeScale ? 1 : 0.8,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              color: Colors.white.withOpacity(0.2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.text,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Image.asset(
                      widget.image,
                      height: 200,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
