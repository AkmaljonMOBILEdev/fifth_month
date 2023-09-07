import 'dart:io';
import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:fifth_month/cubit/downloader_cubit/downloader_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../data/models/file/file_model.dart';
import '../../data/services/local_notification_service.dart';

class DownloaderCubit extends Cubit<DownloaderState>{
  DownloaderCubit():super(const DownloaderState(progress: 0.0, newFileLocation: ""));

  void downloadIfExists({
    required FileInfo fileInfo,
  }) async {
    bool hasPermission = await _requestWritePermission();
    if (!hasPermission) return;
    var directory = await getDownloadPath();
    if (directory == null) {
      return;
    }
    String url = fileInfo.fileUrl;
    String newFileLocation =
        "${directory.path}/${fileInfo.fileName}${DateTime.now().millisecond}${url.substring(url.length - 5, url.length)}";

    try {
      LocalNotificationService.localNotificationService
          .showNotification(id: 1, title: "Download LOADING");

      final receiverPort = ReceivePort();

      await Isolate.spawn(
            (List<Object> args) async {
          Dio dio = Dio();
          await dio.download(url, newFileLocation);
          Isolate.exit((args[0] as SendPort), args[1] as String);
        },
        [receiverPort.sendPort, newFileLocation],
      );
      String newLocation = await receiverPort.first as String;
      LocalNotificationService.localNotificationService
          .showNotification(id: 1, title: "Download END");
      if (newLocation.isNotEmpty) OpenFilex.open(newLocation);
    } catch (error) {
      debugPrint("DOWNLOAD ERROR:$error");
    }
  }

  myProgressEmitter(double pr) {
    emit(state.copyWith(progress: pr));
  }

  downloadFile({
    required String fileName,
    required String url,
  }) async {
    //Permission get
    bool hasPermission = await _requestWritePermission();
    if (!hasPermission) return;
    Dio dio = Dio();

    // Userga ko'rinadigan path
    var directory = await getDownloadPath();
    String newFileLocation =
        "${directory?.path}/$fileName${url.substring(url.length - 5, url.length)}";
    var allFiles = directory?.list();

    print("NEW FILE:$newFileLocation");

    List<String> filePaths = [];
    await allFiles?.forEach((element) {
      print("FILES IN DOWNLOAD FOLDER:${element.path}");
      filePaths.add(element.path.toString());
    });

    if (filePaths.contains(newFileLocation)) {
      OpenFilex.open(newFileLocation);
    } else {
      try {
        final receiverPort = ReceivePort();

        await Isolate.spawn(
              (SendPort sendPort) async {
            await dio.download(url, newFileLocation,
                onReceiveProgress: (count, total) {
                  print("COUNT: $count");
                });
            Isolate.exit(sendPort, newFileLocation);
          },
          receiverPort.sendPort,
        );

        OpenFilex.open(await receiverPort.first as String);
      } catch (error) {
        debugPrint("DOWNLOAD ERROR:$error");
      }
    }
  }

  Future<bool> _requestWritePermission() async {
    final statuses = await [
      Permission.photos,
      Permission.storage,
      Permission
          .videos, // Use Permission.videos for videos or Permission.audio for audio
    ].request();
    return statuses[Permission.videos]!.isGranted;
  }

  Future<Directory?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (err) {
      debugPrint("Cannot get download folder path");
    }
    return directory;
  }


}