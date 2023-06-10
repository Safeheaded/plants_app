import 'dart:async';
import 'dart:io';

import 'package:am_project/classes/shallow_book.dart';
import 'package:am_project/models/book.dart';
import 'package:am_project/providers/books_provider.dart';
import 'package:am_project/router/root_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AddReadBookScreen extends StatefulWidget {
  final ShallowBook shallowBook;
  final int? id;
  final double? latitude;
  final double? longitude;
  final String? imageUrl;
  const AddReadBookScreen(
      {super.key,
      required this.shallowBook,
      this.id,
      this.latitude,
      this.longitude,
      this.imageUrl});

  @override
  State<AddReadBookScreen> createState() => _AddReadBookScreenState();
}

class _AddReadBookScreenState extends State<AddReadBookScreen> {
  XFile? _photo;
  final Completer<GoogleMapController> _controller = Completer();
  LatLng? _center;
  LatLng? _marker;
  final Set<Marker> _markers = {};
  void _onCameraMove(CameraPosition position) {
    _marker = position.target;
  }

  Future _saveData() async {
    late Book newBook;
    if (widget.id == null) {
      newBook = await context.read<BooksProvider>().addBook(widget.shallowBook);
    }
    if (!mounted) return;
    String? image;
    if (_photo != null) {
      image = await context.read<BooksProvider>().uploadImage(
          widget.id == null ? newBook.id : widget.id!,
          widget.shallowBook.title,
          _photo!);
    }
    if (!mounted) return;
    context.read<BooksProvider>().updateReadBook(
        widget.id == null ? newBook.id : widget.id!,
        latitude: _markers.isEmpty ? null : _markers.first.position.latitude,
        longitude: _markers.isEmpty ? null : _markers.first.position.longitude,
        image: image);
    context.router.back();
  }

  Future _goToCamera() async {
    final cameras = await availableCameras();
    if (!mounted) return;
    final XFile photo =
        await context.router.push(CameraRoute(cameras: cameras)) as XFile;
    setState(() {
      _photo = photo;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Future<Position> _getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.clear();
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_marker.toString()),
        position: _marker!,
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  @override
  void initState() {
    _getCurrentPosition().then((position) => setState(() {
          _center = LatLng(position.latitude, position.longitude);
        }));
    if (widget.latitude != null && widget.longitude != null) {
      _marker = LatLng(widget.latitude!, widget.longitude!);
      setState(() {
        _center = _marker;
      });
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_marker.toString()),
        position: _marker!,
        icon: BitmapDescriptor.defaultMarker,
      ));
    } else {
      _marker = _center;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Read Book'),
          actions: [
            IconButton(onPressed: _saveData, icon: const Icon(Icons.check))
          ],
        ),
        body: InkWell(
            onTap: _goToCamera,
            child: Column(
              children: [
                if (_photo != null)
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Image.file(
                      File(_photo!.path),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  )
                else
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Image(
                      image: (widget.imageUrl != null
                              ? NetworkImage(widget.imageUrl!)
                              : const AssetImage(
                                  'assets/images/empty_image.png'))
                          as ImageProvider<Object>,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                if (_center != null)
                  Expanded(
                    child: Stack(
                      children: [
                        GoogleMap(
                          markers: _markers,
                          onCameraMove: _onCameraMove,
                          initialCameraPosition:
                              CameraPosition(target: _center!, zoom: 11),
                          onMapCreated: _onMapCreated,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(16),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: FloatingActionButton(
                                onPressed: _onAddMarkerButtonPressed,
                                tooltip: 'Add',
                                child: const Icon(Icons.add_location),
                              ),
                            ))
                      ],
                    ),
                  )
                else
                  const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    ),
                  )
              ],
            )));
  }
}
