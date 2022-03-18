import 'itinerary.dart';

class TravelByTrain extends Itenary {
  double get _price => 30;

  @override
  double calculateCost(int passengerCount, double distance,
      [double totalLuggageKg = 1]) {
    return passengerCount * _price * distance;
  }
}
