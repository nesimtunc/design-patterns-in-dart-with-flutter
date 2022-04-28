import 'itinerary.dart';

class TravelByCar extends Itenary {
  double get _price => 10;

  @override
  double calculateCost(int passengerCount, double distance,
      [double totalLuggageKg = 0]) {
    // No need to calculate luggage cost
    // since it is not applicable for car
    // (assuming it's your car lol)
    return passengerCount * _price * distance;
  }
}
