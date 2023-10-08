class Therapy{
  //Attributes
  String name = '';
  int dosage = 0;
  int timesADay = 0;
  List<DateTime> timeToTake = []; //koliko puta dnevno
  late DateTime overallTakingTime; //dokad se uzima
  int pillsAvaliable = 0;
  
  //Constructor
  Therapy(String name, int dosage, int timesADay, int pillsInBottle){
    this.name = name;
    this.dosage = dosage;
    this.timesADay = timesADay;
    pillsAvaliable = pillsInBottle;
  }
} 