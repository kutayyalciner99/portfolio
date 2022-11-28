import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import 'package:portfolio/components/homepage_card.dart';
import 'package:portfolio/components/horizontal_scroll.dart';
import 'package:portfolio/components/me.dart';
import 'package:portfolio/constants.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: appColorPalette,
          scaffoldBackgroundColor: appColorPalette,
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
              bodyText1: TextStyle(fontFamily: "abel", color: Colors.white),
              bodyText2: TextStyle(
                  fontFamily: "abel", color: Colors.white, fontSize: 20))),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ValueNotifier<double> scrollPos = ValueNotifier(0);
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: ValueListenableBuilder(
        valueListenable: scrollPos,
        builder: (context, value, child) {
          if (value > 10) {
            return FloatingActionButton(
              hoverColor: appColorPalette,
              backgroundColor: appColorPalette,
              foregroundColor: Colors.orange.shade800,
              focusColor: appColorPalette,
              onPressed: () {
                if (scrollController.hasClients) {
                  final position = scrollController.position.minScrollExtent;
                  scrollController.animateTo(
                    position,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeOut,
                  );
                }
              },
              isExtended: true,
              tooltip: "Scroll To Top",
              child: const Icon(Icons.arrow_upward),
            );
          }
          return Container();
        },
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 300,
        title: Row(
          children: [
            const Spacer(
              flex: 10,
            ),
            HoverWidgetComp(
              text: "Me",
            ),
            const Spacer(),
            HoverWidgetComp(
              text: "Projects",
            ),
            const Spacer(),
            HoverWidgetComp(
              text: "Skills",
            ),
            const Spacer(),
            HoverWidgetComp(
              text: "Contact",
            ),
            const Spacer(
              flex: 10,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollController.offset != 0) {
            scrollPos.value = scrollNotification.metrics.pixels;
          }

          return false;
        },
        child: SingleChildScrollView(
          controller: scrollController,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: const [
                    Positioned(
                      left: 100,
                      top: 300,
                      child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            "Me:",
                            style: TextStyle(fontSize: 60),
                          )),
                    ),
                    Align(alignment: Alignment.center, child: Me()),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: const [
                      Positioned(
                        left: 100,
                        top: 100,
                        child: RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              "Projects:",
                              style: TextStyle(fontSize: 60),
                            )),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: ComplicatedImageDemo()),
                    ],
                  ),
                ),
                Container(
                  height: 270,
                  width: size.width,
                  color: Colors.white.withOpacity(0.1),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          HomePageCard(
                            title: "Responsive",
                            text:
                                "Cool application designs with \n responsive build",
                            image: "assets/background.gif",
                          ),
                          HomePageCard(
                            title: "Frontend",
                            text:
                                "I build mobile Applications with \n Flutter (For Android and IOS).",
                            image: "assets/flutter_logo.png",
                          ),
                          HomePageCard(
                            title: "Backend",
                            text:
                                "I build backend services with\n .NETCore for apis.",
                            image: "assets/Csharp_logo.png",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Stack(
                children: <Widget>[
                  Image.network(item, fit: BoxFit.cover, width: 1000),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        'No. ${imgList.indexOf(item)} image',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ))
    .toList();

class ComplicatedImageDemo extends StatelessWidget {
  const ComplicatedImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 800,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlayCurve: Curves.easeInOut,
          enableInfiniteScroll: true,
          scrollPhysics: const BouncingScrollPhysics(),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: imageSliders,
      ),
    );
  }
}

class HoverWidgetComp extends StatefulWidget {
  String text;
  HoverWidgetComp({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<HoverWidgetComp> createState() => _HoverWidgetCompState();
}

class _HoverWidgetCompState extends State<HoverWidgetComp>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: HoverCrossFadeWidget(
        cursor: SystemMouseCursors.click,
        duration: const Duration(milliseconds: 200),
        firstChild: Text(widget.text),
        secondChild:
            Text(widget.text, style: TextStyle(color: Colors.orange.shade600)),
      ),
    );
  }
}
