import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:towfix_service/core/dto/address/address.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

final onPositionStreamChangedProvider = StreamProvider<Position>((ref) {
  Geolocator.requestPermission().then((value) {
    log('every single time: $value');
  });

  Address? address;
  const LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );
  final positionStream =
      Geolocator.getPositionStream(locationSettings: locationSettings)
          .listen((Position? position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position!.latitude!, position.longitude);
    log('$position 1');
    print(position == null
        ? 'Unknown'
        : '${position.latitude.toString()}, ${position.longitude.toString()}');

    address = Address.initial().copyWith(
        latitude: position.latitude,
        longitude: position.longitude,
        name: placemarks.first.name ?? '');
  });

  return Geolocator.getPositionStream(locationSettings: locationSettings);
});

class PositionStreamChangeService {
  PositionStreamChangeService(this.ref) {
    _init();
  }

  final Ref ref;

  void _init() {
    ref.listen<AsyncValue<Position>>(onPositionStreamChangedProvider,
        (previous, next) async {
      log('prev: $previous, next: $next', name: 'PositionStreamChangeService');
      log('next: ${next?.value}', name: 'PositionStreamChangeService');
      if (next.value != null) {
        List<Placemark> placemarks = await placemarkFromCoordinates(
            next.value!.latitude!, next.value!.longitude);
        ref.read(currentPositionStreamProvider.notifier).state =
            Address.initial().copyWith(
                latitude: next.value!.latitude,
                longitude: next.value!.longitude,
                name: placemarks.first.name ?? '');
      }
    });
  }
}

final currentPositionStreamProvider = StateProvider<Address?>((ref) {
  return null;
});

// auth statechanged service provider
final positionStreamChangeServiceProvider =
    Provider<PositionStreamChangeService>((ref) {
  return PositionStreamChangeService(ref);
});
