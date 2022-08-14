import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/image_model.dart';

class ImageRepository
{

  Future<List<PixelFordImage>> getNetworkImages() async {
    var endpointURL = Uri.parse("https://pixelford.com/api2/images");
    final response = await http.get(endpointURL);
    if (response.statusCode == 200) {
      final List<dynamic> decodedList = jsonDecode(response.body) as List;
      final List<PixelFordImage> _imageslist =
      decodedList.map((e) => PixelFordImage.fromJson(e)).toList();
      print(_imageslist[0].urlFullSize);
      return _imageslist;
    }
    else
      throw "API NOT WORKING";
  }

}