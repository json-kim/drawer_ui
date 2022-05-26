import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  static void openDrawer(BuildContext context) {
    context.findRootAncestorStateOfType<ScaffoldState>()?.openDrawer();
  }

  static void closeDrawer(BuildContext context) {
    context.findRootAncestorStateOfType<ScaffoldState>()?.closeDrawer();
  }

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final PageController _pageController = PageController();

  void movePage(int page) => _pageController.jumpToPage(page);

  void navigatePage(String route) {}

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () => MainDrawer.closeDrawer(context),
                      icon: const Icon(Icons.close))
                ],
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.2))),
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            DrawerDepthButton(
                              onTap: () => movePage(0),
                              title: '공고',
                            ),
                            DrawerDepthButton(
                              onTap: () => movePage(1),
                              title: '커뮤니티',
                            ),
                            DrawerDepthButton(
                              onTap: () => navigatePage('coverletter'),
                              title: '자소서',
                            ),
                            DrawerDepthButton(
                              onTap: () => navigatePage('calendar'),
                              title: '공고달력',
                            ),
                            DrawerDepthButton(
                              onTap: () => navigatePage('more'),
                              title: '더보기',
                            ),
                          ],
                        )),
                    Expanded(
                      flex: 7,
                      child: PageView(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _pageController,
                        children: [
                          Column(
                            children: [
                              DrawerDepthButton(onTap: () {}, title: '채용'),
                              DrawerDepthButton(onTap: () {}, title: '인턴'),
                              DrawerDepthButton(onTap: () {}, title: '대외활동'),
                              DrawerDepthButton(onTap: () {}, title: '공모전'),
                              DrawerDepthButton(onTap: () {}, title: '동아리'),
                            ],
                          ),
                          Column(
                            children: [
                              DrawerDepthButton(
                                onTap: () {},
                                title: '홈',
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ))
            ],
          )),
    );
  }
}

class DrawerDepthButton extends StatelessWidget {
  final void Function() onTap;
  final String title;

  const DrawerDepthButton({
    required this.onTap,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.2))),
        height: 50,
        alignment: Alignment.center,
        child: Text(title),
      ),
    );
  }
}
