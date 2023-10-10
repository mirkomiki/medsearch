import 'package:medsearch/TypesOfData/therapy.dart';

// FILE WITH GLOBAL VARIABLES AND FUNCTIONS

List<Therapy> therapies = [
    Therapy('Sinersul', 500, 1, 20),
    Therapy('Brufen', 1000, 2, 40),
    Therapy('Redbull', 330, 1, 1),
  ];
  List<Therapy> getTherapies(){
    return therapies;
  }