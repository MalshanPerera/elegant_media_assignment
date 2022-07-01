import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/hotels_model.dart';

class MapView extends StatefulWidget {
  final Data data;
  const MapView({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map View"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: GoogleMap(
        markers: {
          Marker(
            markerId: MarkerId("${widget.data.id}"),
            infoWindow: InfoWindow(
              title: widget.data.title,
              snippet: widget.data.description,
            ),
            position: LatLng(
              double.parse(widget.data.latitude),
              double.parse(widget.data.longitude),
            ),
          ),
        },
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            double.parse(widget.data.latitude),
            double.parse(widget.data.longitude),
          ),
          zoom: 14.4746,
        ),
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
