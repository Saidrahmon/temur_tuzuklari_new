import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService{

  final box = GetStorage();
  var _zoom = 1.0.obs;
  var _isBold = false.obs;
  var _isRead = false.obs;

  @override
  void onInit() {
    super.onInit();
    setZoom(box.read('zoom') ?? 1);
    setIsBold(box.read('isBold') ?? false);
    setIsRead(box.read('isRead') ?? false);
  }

  void setZoom(double zoom){
    _zoom.value = zoom;
    box.write('zoom', zoom);
  }

  double getZoom(){
    return _zoom.value;
  }

  void setIsBold(bool isBold){
    _isBold.value = isBold;
    box.write('isBold', isBold);
  }

  bool getIsBold(){
    return _isBold.value;
  }

  void setIsRead(bool isRead){
    _isRead.value = isRead;
    box.write('isRead', isRead);
  }

  bool getIsRead(){
    return _isRead.value;
  }
}