class DogModel {
  int? id;
  String? name;
  String? age;
  String? weight;
  String? shelter;
  String? location;
  String? description;
  String? breed;
  String? image;

  DogModel(
      {this.id,
      this.name,
      this.age,
      this.weight,
      this.shelter,
      this.location,
      this.description,
      this.breed,
      this.image});

  DogModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    weight = json['weight'];
    shelter = json['shelter'];
    location = json['location'];
    description = json['description'];
    breed = json['breed'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['age'] = this.age;
    data['weight'] = this.weight;
    data['shelter'] = this.shelter;
    data['location'] = this.location;
    data['description'] = this.description;
    data['breed'] = this.breed;
    data['image'] = this.image;
    return data;
  }
}