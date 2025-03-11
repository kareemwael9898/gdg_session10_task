import 'package:flutter/material.dart';
import 'package:gdg_session_10/generated/assets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:svg_flutter/svg_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Color(0xff121212),
        backgroundColor: Colors.white,
        title: Image.asset(
          Assets.imagesInstagramLogo,
          width: 100,
          height: 100,
          color: Colors.black,
        ),
        centerTitle: true,
        leading: Center(
            child: SvgPicture.asset(
          Assets.appbarShape,
          width: 24,
          height: 22,
          color: Colors.black,
        )),
        actions: [
          SvgPicture.asset(
            Assets.appbarIGTV,
            width: 24,
          ),
          SizedBox(
            width: 18,
          ),
          SvgPicture.asset(
            Assets.appbarMessanger,
            width: 24,
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 98,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProfileImage(
                  hasBorders: true,
                  isLive: index == 1,
                  text: "Your Story",
                );
              },
              itemCount: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Row(
              children: [
                ProfileImage(
                  size: 32,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "joshua_l",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.verified,
                          color: Color(0xff3897F0),
                          size: 10,
                        )
                      ],
                    ),
                    Text(
                      "Tokyo, Japan",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          color: Colors.black),
                    )
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.more_horiz,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 375,
            child: PageView.builder(
                controller: controller,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                      height: 375,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/img_1.png"),
                              fit: BoxFit.fill)),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 34,
                          margin: EdgeInsets.all(10),
                          height: 26,
                          decoration: BoxDecoration(
                              color: Color(0xff121212),
                              borderRadius: BorderRadius.circular(13)),
                          child: Center(
                              child: Text(
                            "${index + 1}/3",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )),
                        ),
                      ));
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                SvgPicture.asset(Assets.postLike),
                SizedBox(
                  width: 15,
                ),
                SvgPicture.asset(Assets.postComment),
                SizedBox(
                  width: 15,
                ),
                SvgPicture.asset(Assets.appbarMessanger),
                SizedBox(
                  width: 80,
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: JumpingDotEffect(
                      activeDotColor: Color(0xff3897F0),
                      dotColor: Colors.black.withValues(alpha: .33),
                      dotHeight: 6,
                      dotWidth: 6,
                      spacing: 4),
                ),
                Spacer(),
                SvgPicture.asset(Assets.postSave),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                ProfileImage(size: 17),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Liked by ", style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: "craig_love",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: " and ", style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: "44,686 others",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ])),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "joshua_l",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        " The game in Japan was amazing and I want to share some photos",
                    style: TextStyle(color: Colors.black)),
              ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                  color: Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_outline_rounded,
                  color: Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: ProfileImage(
                  size: 30,
                ),
                label: ''),
          ],
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    this.size = 62,
    this.text,
    this.isLive = false,
    this.hasBorders = false,
  });

  final String? text;
  final double size;
  final bool isLive;
  final bool hasBorders;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            // if (hasBorders == true)
            Container(
              width: hasBorders == true ? size : size * 58 / 62,
              height: size,
              margin: EdgeInsets.symmetric(
                horizontal: size * 10 / 62,
                vertical: size * 8 / 62,
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffFBAA47),
                      Color(0xffD91A46),
                      Color(0xffA60F93),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: size * 58 / 62,
                  height: size * 58 / 62,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                      "assets/images/img.png",
                    )),
                  ),
                ),
              ),
            ),
            if (isLive == true)
              Positioned.fill(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SvgPicture.asset(
                      Assets.svgsLive,
                      height: size * 16 / 62,
                    )),
              ),
          ],
        ),
        if (text != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text!,
                maxLines: 1,
                style: TextStyle(
                  fontSize: size * 12 / 62,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          )
      ],
    );
  }
}
