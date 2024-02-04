import 'package:flutter/material.dart';
import 'package:pet_adopt/helpers/common_text.dart';
import 'package:pet_adopt/model/dog_model.dart';
import 'package:pet_adopt/screens/details/screens/profile.dart';

class PetCard extends StatelessWidget {
  const PetCard({
    super.key,
    required this.dog,
  });

  final DogModel dog;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 900),
                pageBuilder: (_, __, ___) => ProfileScreen(dog: dog)));
      },
      child: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.29,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Hero(
                tag: "pet${dog.id}",
                child: Image.asset(
                  dog.image.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  CommonText(
                    text: dog.name.toString(),
                    fontWeight: FontWeight.bold,
                  ),
                  CommonText(
                    text: dog.breed.toString(),
                    fontSize: 10,
                  ),
                ],
              ),
              CommonText(text: dog.age.toString()),
            ],
          )
        ],
      ),
    );
  }
}
