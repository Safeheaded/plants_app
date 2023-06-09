import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

@RoutePage<XFile>()
class CameraScreen extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const CameraScreen({super.key, this.cameras});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  bool _isRearCameraSelected = true;

  Future _initCamera(CameraDescription cameraDescription) async {
// create a CameraController
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
// Next, initialize the controller. This returns a Future.
    try {
      await _cameraController.initialize();
      if (!mounted) return;
      setState(() {});
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  void initState() {
    _initCamera(widget.cameras![0]);
    super.initState();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      await _cameraController.setFlashMode(FlashMode.off);
      XFile picture = await _cameraController.takePicture();
      if (!mounted) {
        return null;
      }
      context.router.pop(picture);
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        _cameraController.value.isInitialized
            ? CameraPreview(_cameraController)
            : const Center(child: CircularProgressIndicator()),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.20,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                color: Colors.white),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: IconButton(
                  onPressed: () {
                    setState(
                        () => _isRearCameraSelected = !_isRearCameraSelected);
                    _initCamera(widget.cameras![_isRearCameraSelected ? 0 : 1]);
                  },
                  padding: EdgeInsets.zero,
                  iconSize: 30,
                  color: Colors.blue,
                  icon: _isRearCameraSelected
                      ? const Icon(Icons.switch_camera_outlined)
                      : const Icon(Icons.switch_camera),
                )),
                Expanded(
                    child: IconButton(
                  onPressed: takePicture,
                  iconSize: 50,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(
                    Icons.circle,
                    color: Colors.blue,
                  ),
                )),
                const Spacer()
              ],
            ),
          ),
        )
      ],
    )));
  }
}
