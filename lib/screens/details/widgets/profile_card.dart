import 'package:flutter/material.dart';
import 'package:pet_adopt/helpers/common_text.dart';
import 'package:pet_adopt/model/dog_model.dart';

class ProfileCardContent extends StatelessWidget {
  const ProfileCardContent({Key? key, required this.dog}) : super(key: key);
  final DogModel dog;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final backgroundColor = Theme.of(context).backgroundColor;
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          CommonText(
            text: dog.name.toString(),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 0.01 * size.height,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonText(
                text: dog.breed.toString(),
              ),
              SizedBox(
                width: 0.03*size.width,
              ),
              CommonText(text: dog.age.toString()),
              SizedBox(
                width: 0.03*size.width,
              ),
              CommonText(text: dog.weight.toString()),
            ],
          ),
          SizedBox(
            height: 0.02 * size.height,
          ),
          Row(
            children: [
              ClipRRect(
                child: Image.asset('assets/logo.png', width: 0.2*size.width),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    width: size.width * 0.6,
                    child: CommonText(
                      maxLine: 2,
                      text: dog.shelter.toString(),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CommonText(
                    text: dog.location.toString(),
                  ),
                ],
              )
            ],
          ),
          
          CommonText(text: dog.description.toString()),
        ],
      ),
    );
  }
}
