import 'package:get/get.dart';

class ButtonNavigationControlleR extends GetxController {
 final _selectedIndex = 0.obs;
  get selectedIndex => _selectedIndex.value;
  set selectedIndex(index) => _selectedIndex.value = index;
  
  RxInt selectedPaymentType = RxInt(0);

}