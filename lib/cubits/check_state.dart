part of 'check_cubit.dart';

class CheckState {
  final Uint8List? image;
  CheckState({this.image});

  CheckState copyWith(Uint8List? image)=>CheckState(image: image?? this.image);
}
