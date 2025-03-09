import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff121212),
        title: Image.asset(
          "assets/images/instagram_logo.png",
          width: 100,
          height: 100,
        ),
        actions: [
          Icon(
            Icons.add,
            color: Colors.white,
          ),
          Icon(
            Icons.remove,
            color: Colors.white,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 98,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                        width: 62,
                        height: 62,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        padding: EdgeInsets.all(3),
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
                        child: ProfileImage()),
                    Text(
                      "Your Story",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )
                  ],
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
                              color: Colors.white),
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
                          color: Colors.white),
                    )
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.more_horiz,
                  color: Colors.white,
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
                                borderRadius: BorderRadius.circular(13)
                            ),
                            child: Center(child: Text("${index+1}/3",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w400),)),
                          ),));
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Icon(
                  Icons.favorite_outline_rounded,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.comment,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 80,
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: JumpingDotEffect(
                      activeDotColor: Color(0xff3897F0),
                      dotColor: Colors.white.withValues(alpha: .33),
                      dotHeight: 6,
                      dotWidth: 6,
                      spacing: 4),
                ),
                Spacer(),
                Icon(
                  Icons.save,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.black),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline_rounded), label: ''),
            BottomNavigationBarItem(
                icon: ProfileImage(
                  size: 23,
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
    this.size = 58,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: AssetImage(
          "assets/images/img.png",
        )),
      ),
    );
  }
}
