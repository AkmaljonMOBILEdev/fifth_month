import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:fifth_month/data/service/permission_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

part 'check_state.dart';

class CheckCubit extends Cubit<CheckState> {
  CheckCubit() : super(CheckState());

  takeScreenShotAndSave(GlobalKey key)async{
    RenderRepaintBoundary boundary = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    var screenImage = await boundary.toImage();
    var imageInByte = await screenImage.toByteData(format: ImageByteFormat.png);
    await PermissionUtil.requestAll();
    var pngBytes = imageInByte!.buffer.asUint8List();
    var path = await ImageGallerySaver.saveImage(pngBytes);
    debugPrint("Image path: $path");
    emit(state.copyWith(imageInByte.buffer.asUint8List()));
  }
  void clearScreenShot() {
    emit(CheckState(image: Uint8List(0)));
  }
  void shareImage(Uint8List imageBytes) async {
    try {
      // Get a temporary directory to save the image
      final directory = await getTemporaryDirectory();
      final path = '${directory.path}/temp.png';

      // Create a File instance and write the image bytes into it
      final file = File(path);
      await file.writeAsBytes(imageBytes);

      // Share the image using share_plus
      Share.shareFiles([path], text: 'Here is the captured image.');
    } catch (e) {
      print("An error occurred while sharing the image: $e");
    }
  }
  }

  



