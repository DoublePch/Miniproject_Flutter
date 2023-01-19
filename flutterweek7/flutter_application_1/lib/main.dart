import 'dart:io';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';

List<CameraDescription>? cameras;
CameraController? controller;
bool _isRecordingInprogress = false;
String videoStatus = '';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  dynamic numCamera = 0;

  void _takePicture() async {
    bool canVibrate = await Vibrate.canVibrate;
    try {
      if (controller != null) {
        if (controller!.value.isInitialized) {
          canVibrate ? Vibrate.vibrate() : print('can not vibrate');
          XFile image = await controller!.takePicture();
          File imageFile = File(image.path);

          int currentUnix = DateTime.now().millisecondsSinceEpoch;
          final directory = await getApplicationDocumentsDirectory();
          String fileFormat = imageFile.path.split('.').last;
          await GallerySaver.saveImage(image.path, toDcim: true);
          await imageFile.copy(
            '${directory.path}/$currentUnix.$fileFormat',
          );
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void _takevidio() async {
    if (_isRecordingInprogress) {
      XFile? rowVideo = await stopVideoRecording();
      File videoFile = File(rowVideo!.path);
      int currentUnix = DateTime.now().millisecondsSinceEpoch;
      final directory = await getApplicationDocumentsDirectory();
      String fileFormat = videoFile.path.split('.').last;
      await videoFile.copy(
        '${directory.path}/$currentUnix.$fileFormat',
      );
      await GallerySaver.saveVideo(rowVideo.path, toDcim: true);
      videoStatus = '';
    } else {
      await startVideoRecording();

      // await startVideoRecording();
      videoStatus = 'Reconding';
    }
    setState(() {});
  }

  Future<void> startVideoRecording() async {
    try {
      await controller!.startVideoRecording();
      setState(() {
        _isRecordingInprogress = true;
      });
    } on CameraException catch (e) {
      print("Error starting video recording: $e");
    }
  }

  Future<XFile?> stopVideoRecording() async {
    try {
      XFile file = await controller!.stopVideoRecording();
      setState(() {
        _isRecordingInprogress = false;
      });
      return file;
    } on CameraException catch (e) {
      print("Error stopping video recording: $e");
      return null;
    }
  }

  void loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![numCamera], ResolutionPreset.max);
      controller!.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } else {
      print("NO any camera found");
    }
  }

  void flipCamera() {
    numCamera < cameras?.length ? numCamera++ : numCamera = 0;
    setState(() {
      loadCamera();
    });
  }

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: controller == null
              ? const Center(
                  child: Text('Loading Camera...'),
                )
              : !controller!.value.isInitialized
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : CameraPreview(controller!),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: _takePicture,
              tooltip: 'Increment',
              child: const Icon(Icons.camera),
            ),
            FloatingActionButton(
              onPressed: flipCamera,
              tooltip: 'Increment',
              child: const Icon(Icons.autorenew),
            ),
            FloatingActionButton(
              onPressed: _takevidio,
              tooltip: 'Increment',
              backgroundColor:
                  _isRecordingInprogress ? Colors.red : Colors.blue,
              child: const Icon(Icons.video_call),
            ),
          ],
        ));
  }
}
