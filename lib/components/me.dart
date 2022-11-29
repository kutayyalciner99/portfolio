import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:typewritertext/typewritertext.dart';

class Me extends StatefulWidget {
  const Me({
    Key? key,
  }) : super(key: key);

  @override
  State<Me> createState() => _MeState();
}

class _MeState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: HoverContainer(
          hoverDecoration: BoxDecoration(
              border: Border.all(color: Colors.orange.shade800, width: 2),
              borderRadius: BorderRadius.circular(24)),
          decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.white.withOpacity(0.2), width: 2),
              borderRadius: BorderRadius.circular(24)),
          height: 700,
          width: 1200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          "assets/programmer.jpg",
                          height: 300,
                          width: 500,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TypeWriterText(
                            play: true,
                            maintainSize: false,
                            text: Text(
                              "Hi, I am Kutay Yalçıner",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.orange.shade600,
                                  fontSize: 24,
                                  fontFamily: "abel"),
                            ),
                            duration: const Duration(milliseconds: 100)),
                        const SizedBox(
                          height: 300,
                          width: 600,
                          child: AutoSizeText(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,",
                            minFontSize: 22,
                            softWrap: true,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 300,
                      width: 600,
                      child: Center(
                        child: AutoSizeText(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,",
                          softWrap: true,
                          minFontSize: 22,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          "assets/side_image.png",
                          height: 300,
                          width: 500,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
