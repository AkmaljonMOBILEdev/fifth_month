import 'package:fifth_month/cubit/downloader_cubit/downloader_cubit.dart';
import 'package:fifth_month/cubit/downloader_cubit/downloader_state.dart';
import 'package:fifth_month/data/models/file/file_model.dart';
import 'package:fifth_month/utils/colors.dart';
import 'package:fifth_month/utils/icons.dart';
import 'package:fifth_month/utils/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_filex/open_filex.dart';

class FileHolder extends StatelessWidget {
  const FileHolder({
    super.key,
    required this.fileInfo,
  });

  final FileInfo fileInfo;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DownloaderCubit, DownloaderState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          width: theSize(context).width / 1.4,
          height: theSize(context).height / 11.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                // topRight: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r)),
            color: AppColors.white.withOpacity(.3),
          ),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    if(state.newFileLocation.isEmpty){
                      context.read<DownloaderCubit>().downloadFile(fileName: fileInfo.fileName, url: fileInfo.fileUrl);
                    }else{
                      OpenFilex.open(state.newFileLocation);
                    }
                  },
                  icon: Icon(
                    state.newFileLocation.isEmpty
                    ?Icons.download
                    :Icons.file_open,
                    color: AppColors.c1C1C1C,
                  )),
              Text("${fileInfo.fileName}${fileInfo.fileUrl.substring(fileInfo.fileUrl.length-4, fileInfo.fileUrl.length)}")
              // Text(fileInfo.fileName)
            ],
          ),
        );
      },
    );
  }
}
