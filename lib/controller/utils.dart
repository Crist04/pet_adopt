import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pet_adopt/model/dog_model.dart';

class PetNotifier extends GetxController {
  List<DogModel> _petList = [];

  List<DogModel> get petList => _petList;

  Future<void> getPets() async {
    final String data = await rootBundle.loadString('assets/pet_data/data.json');
    final response = await json.decode(data);
    _petList = List.from(
      response.map((e) => DogModel.fromJson(e)),
    );
    update();
  }
}
