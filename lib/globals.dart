import 'package:medsearch/TypesOfData/therapy.dart';

// FILE WITH GLOBAL VARIABLES AND FUNCTIONS

List<Therapy> therapies = [
    Therapy('Sinersul', 500, 1, 20, DateTime.now(), DateTime.now()),
    Therapy('Brufen', 1000, 2, 40, DateTime.now(), DateTime.now()),
    Therapy('Redbull', 330, 1, 1, DateTime.now(), DateTime.now()),
  ];
  List<Therapy> getTherapies(){
    return therapies;
  }