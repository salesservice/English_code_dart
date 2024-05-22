import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_isell_new/core/classes/statusrequest.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

imageUploadCamera() async {
  final PickedFile? file = (await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 90)) as PickedFile?;
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

fileUploadGallery([isSvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: isSvg
          ? ["svg", "SVG"]
          : [
              "svg",
              "SVG",
              "png",
              "PNG",
              "jpg",
              "JPG",
              "jpeg",
              "JPEG",
              "gif",
              "GIF"
            ]);
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

String _basicAuth =
    'Basic ${base64Encode(utf8.encode('dddd:sdfsdfsdfsdfdsf'))}';
Map<String, String> _myheaders = {
  // 'content-type': 'application/json',
  // 'accept': 'application/json',
  'authorization': _basicAuth
};

Future<Either<StatusRequest, Map>> addRequestWithImageOne(
    url, data, File? image,
    [String? namerequest]) async {
  if (namerequest == null) {
    namerequest = "files";
  }

  var uri = Uri.parse(url);
  var request = http.MultipartRequest("POST", uri);
  request.headers.addAll(_myheaders);

  if (image != null) {
    var length = await image.length();
    var stream = http.ByteStream(image.openRead());
    stream.cast();
    var multipartFile = http.MultipartFile(namerequest, stream, length,
        filename: basename(image.path));
    request.files.add(multipartFile);
  }

  // add Data to request
  data.forEach((key, value) {
    request.fields[key] = value;
  });
  // add Data to request
  // Send Request
  var myrequest = await request.send();
  // For get Response Body
  var response = await http.Response.fromStream(myrequest);
  if (response.statusCode == 200 || response.statusCode == 201) {
    print(response.body);
    Map responsebody = jsonDecode(response.body);
    return Right(responsebody);
  } else {
    return const Left(StatusRequest.serverfailure);
  }
}
