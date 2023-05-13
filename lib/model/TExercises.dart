class TExercises {
  int? id;
  String? name;
  String? image;
  int ?isTimer;
  int ?timer;
  int? steps;

  TExercises( {this.id, required this.name,required this.image, required this.isTimer,
   required   this.steps ,required this.timer });


 TExercises.fromMap(Map map) {
    id = map['id'];
    name = map['name'];
    image = map['image'] ;
    steps = map['steps'] ;
    isTimer = map['isTimer'] ;
    timer = map['timer'] ;
  }
  toMap() {
    return {
      "name": name,
      "image": image,
      "isTimer": isTimer,
      "timer": timer,
      "steps": steps
    };
  }
}
