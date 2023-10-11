import 'package:medsearch/TypesOfData/therapy.dart';
class TherapyManager {
  static final TherapyManager _instance = TherapyManager._internal();
  List<Therapy> therapies = [];

  factory TherapyManager() {
    return _instance;
  }

  TherapyManager._internal();

  // Add a new therapy to the list
  void addTherapy(Therapy therapy) {
    therapies.add(therapy);
  }

  // Update an existing therapy
  void updateTherapy(int index, Therapy updatedTherapy) {
    if (index >= 0 && index < therapies.length) {
      therapies[index] = updatedTherapy;
    }
  }
}
