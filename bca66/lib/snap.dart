import 'package:image_picker/image_picker.dart';

Future<void> pickImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.getImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    // Handle the picked image
  } else {
    // User canceled the image picking
  }
}

import 'package:camera/camera.dart';

Future<void> initializeCamera() async {
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  // Initialize the camera
  final CameraController _controller = CameraController(
    firstCamera,
    ResolutionPreset.medium,
  );
  await _controller.initialize();
}

import 'package:image/image.dart' as img;

void applyFilter(String imagePath) {
  img.Image image = img.decodeImage(File(imagePath).readAsBytesSync());

  // Apply filter
  image = img.grayscale(image);

  // Save or display the filtered image
  File('$path/to/save/filtered/image.png').writeAsBytesSync(img.encodePng(image));
}