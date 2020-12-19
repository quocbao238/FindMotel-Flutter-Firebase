import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseStorageService {
//I use firebaseStorage to updateImage Motels & Update Avatar
  Future<String> updateAvatar({String uid}) async {
    String resultUrl;
    try {
      PickedFile _pickedFile = await ImagePicker()
          .getImage(source: ImageSource.gallery, maxHeight: 200, maxWidth: 200);
      if (_pickedFile != null) {
        //convert PickedFile -> File to put FirebaseStorage
        File _imgUpdate = File(_pickedFile.path);
        var updateTask = FirebaseStorage.instance
            .ref()
            .child('userAvatar/$uid')
            .putFile(_imgUpdate);
        resultUrl = await updateTask.snapshot.ref.getDownloadURL();
      }
    } catch (e) {
      print("Cacth in FirebaseStorageService - updateAvatar: $e");
    }
    return resultUrl;
  }

  Future<String> updateImagePost({String title}) async {
    var imageFileName =
        title + DateTime.now().millisecondsSinceEpoch.toString();
    String resultUrl;
    try {
      PickedFile _pickedFile = await ImagePicker()
          .getImage(source: ImageSource.gallery, maxHeight: 200, maxWidth: 200);
      if (_pickedFile != null) {
        //convert PickedFile -> File to put FirebaseStorage
        File _imgUpdate = File(_pickedFile.path);
        var updateTask = FirebaseStorage.instance
            .ref()
            .child('$imageFileName')
            .putFile(_imgUpdate);
        resultUrl = await updateTask.snapshot.ref.getDownloadURL();
      }
    } catch (e) {
      print("Cacth in FirebaseStorageService - updateImagePost: $e");
    }
    return resultUrl;
  }

  Future<String> readImageUrl({String title}) async {
    String url;
    try {
      url = await FirebaseStorage.instance.ref().child(title).getDownloadURL();
    } catch (e) {
      print(e.toString());
    }
    return url;
  }
}
