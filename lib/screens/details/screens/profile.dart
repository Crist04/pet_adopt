// ignore_for_file: prefer_const_constructors

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adopt/model/dog_model.dart';
import 'package:pet_adopt/screens/details/controller/pet_controller.dart';
import 'package:pet_adopt/screens/details/widgets/confetti.dart';
import 'package:pet_adopt/screens/details/widgets/profile_card.dart';
import 'package:pet_adopt/screens/details/widgets/rounded_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.dog}) : super(key: key);
  final DogModel dog;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ConfettiController _controller = ConfettiController();
  final adoptController = Get.put(AdoptionNotifier());
  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(
      duration: Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Hero(
        tag: "pet${widget.dog.id}",
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: Image.asset(
                  widget.dog.image.toString(),
                  width: size.width,
                  fit: BoxFit.cover,
                )),
                Confettis(controller: _controller),
                SizedBox(height: size.height / 2.5, width: size.width)
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).backgroundColor),
                height: size.height / 1.8,
                child: Column(
                  children: [
                    ProfileCardContent(
                      dog: widget.dog,
                    ),
                    SizedBox(
                      height: 0.03 * size.height,
                    ),
                    Confettis(controller: _controller),
                    adoptController.isAdopted(widget.dog.id.toString()) == true
                        ? RoundedIconTextButton(
                            buttonText: 'Adopted',
                            backgroundColor: Colors.grey,
                            fontWeight: FontWeight.bold,
                          )
                        : RoundedIconTextButton(
                            onPressed: () {
                              setState(() {
                                adoptController
                                    .adoptPet(widget.dog.id.toString());
                                _controller.play();
                              });
                            },
                            buttonText: 'Adopt Me',
                            backgroundColor: Color(0xff89CFF0),
                            fontWeight: FontWeight.bold,
                          ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: size.height / 15,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: 30,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
