import 'itinerary.dart';
import 'travel_by.dart';
import 'travel_by_car.dart';
import 'travel_by_plane.dart';
import 'travel_by_train.dart';

class TravelPlanner {
  Itenary createItenary(TravelBy travelBy) {
    switch (travelBy) {
      case TravelBy.train:
        return TravelByTrain();
      case TravelBy.car:
        return TravelByCar();
      case TravelBy.plane:
        return TravelByPlane();
      default:
        throw Exception('Unknown travel type');
    }
  }
}
