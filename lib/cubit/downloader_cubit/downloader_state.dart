import 'package:equatable/equatable.dart';

class DownloaderState extends Equatable{
  const DownloaderState({
    required this.progress,
    required this.newFileLocation,
  });

  final double progress;
  final String newFileLocation;

  DownloaderState copyWith({
    double? progress,
    String? newFileLocation,
  }) =>
      DownloaderState(
        progress: progress ?? this.progress,
        newFileLocation: newFileLocation ?? this.newFileLocation,
      );

  @override
  List<Object?> get props => [progress, newFileLocation];

}