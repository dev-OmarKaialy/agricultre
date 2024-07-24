import 'package:first_app/features/showPlant/view/showplant.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/shared/util.dart';

class ShowPlantController extends GetxController {
  var passtoggle = true.obs;
  var FlowersList = <kind>[];
  var TheKind = kind("", "", "", "", "", "");
  final ImagePicker imagepicker = ImagePicker();
  PickedFile? imagefile;
  final stringPickImage = ''.obs;
  var nameWidget = '';
  var updatePlant = kind("", "", "", "", "", "");
  @override
  void onInit() {
    super.onInit();
    fullFlowers();
  }

  Future pickImageFun() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      stringPickImage.value = Utility.base64String(await image.readAsBytes());
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  var des =
      "موطنه وسط اوربا وشرق اسيا ولها اكثر من لون,تتوزع على 15 تصنيف يعتمد على شكل الزهرة وطولها ووقت ازهارها";
  void fullFlowers() {
    FlowersList.add(kind(
        'assets/images/f1.jpg',
        "التوليب",
        "تحوي  سعرات حرارية عالية",
        "الشتاء 17 اغسطس",
        "يتم حصادها في الربيع ",
        des));
    FlowersList.add(kind(
        'assets/images/f2.jpg',
        "سجاد",
        "تحوي  سعرات حرارية عالية",
        "الشتاء 17 اغسطس",
        "يتم حصادها في الربيع ",
        des));
    FlowersList.add(kind(
        'assets/images/f3.jpg',
        "الاريكا",
        "تحوي  سعرات حرارية عالية",
        "الشتاء 17 اغسطس",
        "يتم حصادها في الربيع ",
        des));
    FlowersList.add(kind(
        'assets/images/f4.jpg',
        "الفل",
        "تحوي  سعرات حرارية عالية",
        "الشتاء 17 اغسطس",
        "يتم حصادها في الربيع ",
        des));
    FlowersList.add(kind(
        'assets/images/f5.jpg',
        "الجهنمية",
        "تحوي  سعرات حرارية عالية",
        "الشتاء 17 اغسطس",
        "يتم حصادها في الربيع ",
        des));
    FlowersList.add(kind(
        'assets/images/f6.jpg',
        "الريحان",
        "تحوي  سعرات حرارية عالية",
        "الشتاء 17 اغسطس",
        "يتم حصادها في الربيع ",
        des));
    FlowersList.add(kind(
        'assets/images/f7.jpg',
        "الكروتون",
        "تحوي  سعرات حرارية عالية",
        "الشتاء 17 اغسطس",
        "يتم حصادها في الربيع ",
        des));
    FlowersList.add(kind(
        'assets/images/f8.jpg',
        "البوتس",
        "تحوي  سعرات حرارية عالية",
        "الشتاء 17 اغسطس",
        "يتم حصادها في الربيع ",
        des));
    FlowersList.add(kind(
        'assets/images/f9.jpg',
        "الزنبق",
        "تحوي  سعرات حرارية عالية",
        "الشتاء 17 اغسطس",
        "يتم حصادها في الربيع ",
        des));
    FlowersList.add(kind(
        'assets/images/f10.jpg',
        "العنكبوت",
        "تحوي  سعرات حرارية عالية",
        "الشتاء 17 اغسطس",
        "يتم حصادها في الربيع ",
        des));
    FlowersList.add(kind(
        'assets/images/f11.jpg',
        "جوري",
        "تحوي  سعرات حرارية عالية",
        "الشتاء 17 اغسطس",
        "يتم حصادها في الربيع ",
        des));
    FlowersList.add(kind(
        'assets/images/f12.jpg',
        "الاوركيد",
        "تحوي  سعرات حرارية عالية",
        "الشتاء 17 اغسطس",
        "يتم حصادها في الربيع ",
        des));
    FlowersList.add(kind(
        'assets/images/f13.jpg',
        "صبار",
        "تحوي  سعرات حرارية عالية",
        "الشتاء 17 اغسطس",
        "يتم حصادها في الربيع ",
        des));
    FlowersList.add(kind(
        'assets/images/f14.jpg',
        "غاردينيا",
        "تحوي  سعرات حرارية عالية",
        "الشتاء 17 اغسطس",
        "يتم حصادها في الربيع ",
        des));
    FlowersList.add(kind(
        'assets/images/f15.jpg',
        " ياسمين",
        "تحوي  سعرات حرارية عالية",
        "الشتاء 17 اغسطس",
        "يتم حصادها في الربيع ",
        des));
    FlowersList.add(kind(
        'assets/images/f16.jpg',
        "الدفلة",
        "تحوي  سعرات حرارية عالية",
        "الشتاء 17 اغسطس",
        "يتم حصادها في الربيع ",
        des));
  }
}
