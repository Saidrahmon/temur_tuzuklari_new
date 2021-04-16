import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService{

  var box = GetStorage();
  var _zoom = 1.0.obs;

  @override
  void onInit() {
    super.onInit();
    box.read('zoom');
  }

  void setZoom(double zoom){
    _zoom.value = zoom;
    box.write('zoom', zoom);
  }

  double getZoom(){
    return _zoom.value;
  }

}