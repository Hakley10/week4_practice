import 'package:flutter/material.dart';
import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        String subtitleText = "";
        IconData iconData = Icons.download;

        final ressource = controller.ressource;
        final totalSize = ressource.size;
        final progress = controller.progress;
        final downloadedSize = totalSize * progress;

        switch (controller.status) {
          case DownloadStatus.notDownloaded:
            subtitleText = "${totalSize.toStringAsFixed(1)}MB";
            iconData = Icons.download;
            break;

          case DownloadStatus.downloading:
            subtitleText = "${(progress * 100).toStringAsFixed(1)}% completed" " - " "${downloadedSize.toStringAsFixed(1)} of ${totalSize.toStringAsFixed(1)} MB";
            iconData = Icons.downloading;
            break;

          case DownloadStatus.downloaded:
            subtitleText = "Completed  ${totalSize.toStringAsFixed(1)} MB";
            iconData = Icons.folder;
            break;
        }

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            title: Text(controller.ressource.name),
            subtitle: Text(subtitleText),
            trailing: IconButton(
              icon: Icon(iconData),
              onPressed: controller.startDownload,
            ),
          ),
        );
      },
    );
  }
}
