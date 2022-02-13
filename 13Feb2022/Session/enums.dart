void main(List<String> args) {
  PickImage pi = PickImage();
  PickImage().pick(SourceType.camera);
}

enum SourceType { camera, gallery, googlePhotos }
enum StudentYear { first, second, googlePhotos }

class PickImage {
  pick(SourceType sourceType) {
    switch (sourceType) {
      case SourceType.camera:
        print("Picking image from camera");
        break;
      case SourceType.gallery:
        print("Picking image from gallery");
        break;
      case SourceType.googlePhotos:
        print("Picking image from Google Photos");
        break;
    }
    String type = "camera";
    SourceType myType = SourceType.gallery;
    if (type == "camera") {
      myType = SourceType.camera;
    }
    if (SourceType.values[0] == sourceType) {
      print("Got camera from values");
    }
  }
}
