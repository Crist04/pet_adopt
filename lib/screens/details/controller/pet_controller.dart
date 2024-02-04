import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pet_adopt/model/dog_model.dart';

class AdoptionNotifier extends GetxController {
  final _myPets = Hive.box('myPets');
  final RxBool isP=false.obs;
  final List<DogModel> adopted=[];
  adoptPet(String id) {
    _myPets.put(id,id);
    print("added");
  }

  isAdopted(String id){
    print(_myPets.get(id));
    return _myPets.containsKey(id);
  }
  
}
