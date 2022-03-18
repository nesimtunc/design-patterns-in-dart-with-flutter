import 'itinerary.dart';

class TravelByPlane extends Itenary {
  double get _price => 50;
  double get _luggagePricePerKg => 10;

  @override
  double calculateCost(int passengerCount, double distance,
      [double totalLuggageKg = 0]) {
    return (passengerCount * _price * distance) +
        (totalLuggageKg * _luggagePricePerKg);
  }
}
