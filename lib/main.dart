import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:simple_animated_icon/simple_animated_icon.dart';

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
          scrollbarTheme: ScrollbarThemeData(
              showTrackOnHover: false,
              thumbVisibility: MaterialStateProperty.all(true),
              minThumbLength: 10,
              trackVisibility: MaterialStateProperty.all(true),
              trackColor:
                  MaterialStateProperty.all(Colors.white.withOpacity(0.1)),
              thumbColor: MaterialStateColor.resolveWith(
                  (states) => Colors.orange.shade800)),
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  ValueNotifier<bool> scrollPos = ValueNotifier(false);
  ScrollController scrollController = ScrollController();
  ScrollController listController = ScrollController();

  bool _isOpened = false;
  late AnimationController _animationController;
  late Animation<double> _progress;

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {
        scrollPos.value = true;
      });
    }
    if (scrollController.offset <= scrollController.position.minScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {
        scrollPos.value = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    scrollController.addListener(_scrollListener);

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      });

    _progress =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void animate() {
    if (_isOpened) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }

    setState(() {
      _isOpened = !_isOpened;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: ValueListenableBuilder(
        valueListenable: scrollPos,
        builder: (context, value, child) {
          if (value) {
            return FloatingActionButton(
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.orange.shade800,
                focusColor: appColorPalette,
                onPressed: () {
                  animate();
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
                child: RotatedBox(
                  quarterTurns: 1,
                  child: SimpleAnimatedIcon(
                    transitions: const [Transitions.zoom_in],
                    startIcon: CupertinoIcons.back,
                    endIcon: CupertinoIcons.back,
                    progress: _progress,
                  ),
                ));
          }
          return Container();
        },
      ),
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   leadingWidth: 300,
      //   title: Row(
      //     children: [
      //       const Spacer(
      //         flex: 10,
      //       ),
      //       HoverWidgetComp(
      //         text: "Me",
      //       ),
      //       const Spacer(),
      //       HoverWidgetComp(
      //         text: "Projects",
      //       ),
      //       const Spacer(),
      //       HoverWidgetComp(
      //         text: "Skills",
      //       ),
      //       const Spacer(),
      //       HoverWidgetComp(
      //         text: "Contact",
      //       ),
      //       const Spacer(
      //         flex: 10,
      //       ),
      //     ],
      //   ),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: CustomScrollView(
          controller: scrollController,
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Row(
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    HoverWidgetComp(
                      text: "Me",
                      onTap: () {
                        scrollController.animateTo(100,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeIn);
                      },
                    ),
                    const Spacer(),
                    HoverWidgetComp(
                      text: "Projects",
                      onTap: () {
                        scrollController.animateTo(
                            scrollController.position.maxScrollExtent,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeIn);
                      },
                    ),
                    const Spacer(),
                    HoverWidgetComp(
                      text: "Skills",
                      onTap: () {
                        scrollController.animateTo(
                            scrollController.position.maxScrollExtent,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeIn);
                      },
                    ),
                    const Spacer(),
                    HoverWidgetComp(
                      text: "Contact",
                      onTap: () {},
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((_, int index) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: const [
                            RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  "Me:",
                                  style: TextStyle(fontSize: 60),
                                )),
                            Align(alignment: Alignment.center, child: Me()),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Spacer(
                                flex: 2,
                              ),
                              RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    "Projects:",
                                    style: TextStyle(fontSize: 60),
                                  )),
                              Spacer(
                                flex: 3,
                              ),
                              Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                      height: 400,
                                      width: 800,
                                      child: ComplicatedImageDemo())),
                              Spacer(
                                flex: 5,
                              )
                            ],
                          ),
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
                              controller: listController,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              children: [
                                HomePageCard(
                                  title: "Responsive",
                                  text:
                                      "Cool application designs with \n responsive & interactive builds",
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
                );
              }, childCount: 1),
            ),
          ],
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
        carouselController: CarouselController(),
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
  Function() onTap;
  HoverWidgetComp({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  State<HoverWidgetComp> createState() => _HoverWidgetCompState();
}

class _HoverWidgetCompState extends State<HoverWidgetComp>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: widget.onTap,
        child: HoverCrossFadeWidget(
          cursor: SystemMouseCursors.click,
          duration: const Duration(milliseconds: 200),
          firstChild: Text(widget.text),
          secondChild: Text(widget.text,
              style: TextStyle(color: Colors.orange.shade600)),
        ),
      ),
    );
  }
}
