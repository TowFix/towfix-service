import 'dart:async';
import 'dart:developer';

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:towfix_service/core/dto/address/address.dart';
import 'package:towfix_service/core/providers/common.dart';
import 'package:towfix_service/core/providers/listeners/position_stream_listener/position_stream_listener_service.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import '../../../../core/application/env/env.dart';
import 'controller/controller.dart';

class MapRouteScreen extends ConsumerStatefulWidget {
  const MapRouteScreen({required this.id, super.key});
  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapRouteScreenState();
}

class _MapRouteScreenState extends ConsumerState<MapRouteScreen> {
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  CameraPosition pickedPosition =
      CameraPosition(target: LatLng(37.43296265331129, -122.08832357078792));
  @override
  Widget build(BuildContext context) {
    final serviceRequestAsyncValue =
        ref.watch(serviceRequestProvider(widget.id));

    final currentPositionAsyncValue = ref.watch(currentPositionStreamProvider);

    return Scaffold(
        appBar: AppBar(),
        body: serviceRequestAsyncValue.when(
            data: (asyncValue) {
              return asyncValue.fold((l) {
                return Column(
                  children: [
                    Text(l.message),
                  ],
                );
              }, (r) {
                final origin = currentPositionAsyncValue;
                final destination = r.origin;

                /// origin marker
                _addMarker(LatLng(origin!.latitude, origin!.longitude),
                    "origin", BitmapDescriptor.defaultMarker);

                /// destination marker
                _addMarker(
                    LatLng(destination!.latitude, destination!.longitude),
                    "destination",
                    BitmapDescriptor.defaultMarkerWithHue(90));
                _getPolyline(origin, destination);
                return Scaffold(
                  body: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(currentPositionAsyncValue!.latitude,
                            currentPositionAsyncValue!.longitude),
                        zoom: 12),
                    myLocationEnabled: true,
                    tiltGesturesEnabled: true,
                    compassEnabled: true,
                    scrollGesturesEnabled: true,
                    zoomGesturesEnabled: true,
                    rotateGesturesEnabled: true,
                    trafficEnabled: true,
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: true,
                    // cameraTargetBounds: CameraTargetBounds(LatLngBounds(
                    //     northeast: LatLng(
                    //       r.routes!.first.bounds!.northeast!.lat!,
                    //       r.routes!.first.bounds!.northeast!.lng!,
                    //     ),
                    //     southwest: LatLng(
                    //       r.routes!.first.bounds!.southwest!.lat!,
                    //       r.routes!.first.bounds!.southwest!.lng!,
                    //     ))),
                    markers: Set<Marker>.of(markers.values),
                    polylines: Set<Polyline>.of(polylines.values),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    onCameraIdle: () {
                      log('camera idle');

                      // serviceReader.searchPlace(pickedPosition.target.latitude,
                      //     pickedPosition.target.longitude);
                    },
                    onCameraMove: (position) {
                      log('position: $position');

                      setState(() {
                        pickedPosition =
                            CameraPosition(target: position.target);
                      });
                    },
                  ),
                  bottomSheet: DraggableScrollableSheet(
                      expand: false,
                      maxChildSize: 0.5,
                      minChildSize: 0.2,
                      builder: (context, scrollController) {
                        return ServiceModalSheet(
                          controller: scrollController,
                        );
                      }),
                );
              });
            },
            error: (error, stackTrace) {
              return Column(
                children: [
                  Text('Ooops, something went wrong'),
                ],
              );
            },
            loading: () => const CircularProgressIndicator()));
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.black,
        points: polylineCoordinates,
        width: 4);
    polylines[id] = polyline;
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _getPolyline(Address origin, Address destination) async {
    // final mapServiceControllerReader =
    //     ref.read(mapServiceControllerProvider.notifier);
    // final mapServiceControllerObserver =
    //     ref.watch(mapServiceControllerProvider);
    // final serviceController = ref.watch(transactionControllerProvider);

    // final serviceReader = ref.read(transactionControllerProvider.notifier);

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        Env.googleMapsApiKey,
        PointLatLng(origin.latitude, origin.longitude),
        PointLatLng(destination.latitude, destination.longitude),
        travelMode: TravelMode.driving,
        wayPoints: []);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }
}

class ServiceModalSheet extends StatefulWidget {
  final ScrollController controller;

  const ServiceModalSheet({
    required this.controller,
    super.key,
  });

  @override
  State<ServiceModalSheet> createState() => _ServiceModalSheetState();
}

class _ServiceModalSheetState extends State<ServiceModalSheet> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.controller,
      children: [],
    );
  }
}
