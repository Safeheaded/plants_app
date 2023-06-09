import 'dart:io';

import 'package:am_project/classes/shallow_book.dart';
import 'package:am_project/router/root_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddReadBookScreen extends StatefulWidget {
  final ShallowBook shallowBook;
  const AddReadBookScreen({super.key, required this.shallowBook});

  @override
  State<AddReadBookScreen> createState() => _AddReadBookScreenState();
}

class _AddReadBookScreenState extends State<AddReadBookScreen> {
  XFile? _photo;

  Future _goToCamera() async {
    final cameras = await availableCameras();
    if (!mounted) return;
    final XFile photo =
        await context.router.push(CameraRoute(cameras: cameras)) as XFile;
    setState(() {
      _photo = photo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Add Read Book')),
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
                  const SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Image(
                      image: AssetImage('assets/images/empty_image.png'),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
              ],
            )));
  }
}
