import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pet_adopt/controller/theme_controller.dart';
import 'package:pet_adopt/controller/utils.dart';
import 'package:pet_adopt/helpers/common_text.dart';
import 'package:pet_adopt/helpers/themes/themes.dart';
import 'package:pet_adopt/screens/history/pet_history.dart';
import 'package:pet_adopt/screens/home/widget/pet_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  final petController = Get.put(PetNotifier());
  final _controller = Get.put(ThemeController());
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);

    petController.getPets();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int activePage = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actionsIconTheme: IconThemeData(size: 50),
        actions: [
          IconButton(
            iconSize: 55,
            icon: Image(
              image: AssetImage('assets/profile.png'),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoryScreen()),
              );
            },
          )
        ],
        leading: Obx(
          () => Switch(
            value: _controller.currentTheme.value == ThemeMode.dark,
            onChanged: (value) {
              _controller.switchTheme();
              Get.changeThemeMode(_controller.currentTheme.value);
            },
            activeColor: CustomTheme.white,
          ),
        ),
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.anchor_rounded,
        //     size: 32,
        //   ),
        //   onPressed: () {

        //   },
        // ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: 'Adopt',
                      fontSize: 32,
                    ),
                    CommonText(
                      text: 'A Friend',
                      fontSize: 32,
                    ),
                    SizedBox(
                      height: 22,
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.3,
                  child: Image(
                    image: AssetImage('assets/pic.png'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: size.width,
                height: 165,
                color: const Color(0XFF89CFF0),
              ),
              Positioned(
                top: 0,
                height: 80,
                width: size.width,
                child: SizedBox(
                  child: SvgPicture.asset(
                    'assets/waves/background-top-wave.svg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                height: 80,
                width: size.width,
                bottom: 0,
                child: SizedBox(
                  child: SvgPicture.asset(
                    'assets/waves/background-bottom-wave.svg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              GetBuilder<PetNotifier>(builder: (value) {
                return SizedBox(
                  height: size.height * 0.4,
                  width: size.width,
                  child: PageView.builder(
                      itemCount: petController.petList.length,
                      pageSnapping: true,
                      controller: _pageController,
                      onPageChanged: (page) {
                        setState(() {
                          activePage = page;
                        });
                      },
                      itemBuilder: (context, index) {
                        return PetCard(dog: petController.petList[index]);
                      }),
                );
              })
            ],
          ),
        ],
      ),
    );
  }
}
