import 'package:flutter/material.dart';
 
import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;
 
 // TODO
  String get subTitle{
        switch(controller.status){
      case DownloadStatus.notDownloaded:
        return '';
      case DownloadStatus.downloading:
        return "${(controller.progress * 100).toStringAsFixed(1)} % completed - ${(controller.ressource.size * controller.progress).toStringAsFixed(1)} of ${controller.ressource.size} MB";
      case DownloadStatus.downloaded:
        return "100.0 % completed - ${(controller.ressource.size).toStringAsFixed(1)} of ${controller.ressource.size} MB";
    }
  }

  IconData get icon{
        switch(controller.status){
      case DownloadStatus.notDownloaded:
        return Icons.download;
      case DownloadStatus.downloading:
        return Icons.downloading;
      case DownloadStatus.downloaded:
        return Icons.folder;
    }
  }
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            title: Text(controller.ressource.name),
            subtitle: Text(subTitle),
            trailing: IconButton(
              icon: Icon(icon),
              onPressed: controller.startDownload,
            ),
          ),
        );
      },
    );
     
    // TODO
  }
}
