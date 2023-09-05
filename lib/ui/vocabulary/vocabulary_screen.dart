import 'package:fifth_month/data/models/universal_data.dart';
import 'package:fifth_month/data/network/api_service.dart';
import 'package:fifth_month/getx/vocabulary_controller/vocabulary_controller.dart';
import 'package:fifth_month/ui/vocabulary/widgets/search.dart';
import 'package:fifth_month/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VocabularyScreen extends StatelessWidget {
  const VocabularyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    VocabularyController controller =
        Get.put(VocabularyController(apiService: ApiService()));
    TextEditingController text = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Vocabulary"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SearchWord(
                  controller: text,
                  onTap: () {
                    debugPrint("WORD IS : ${text.text}");
                    controller.getMeaningOfWord(text.text);
                    debugPrint("mean: ${controller.meanings[0].partOfSpeech}");
                  },
                ),
                // Obx(
                //   () => SizedBox(
                //     height: 500,
                //     child: ListView.builder(
                //       itemCount: controller.meanings.length,
                //       itemBuilder: (context, index) {
                //         final meaning = controller.meanings[index];
                //         return ListTile(
                //           title: Text("THE WORD IS: ${meaning.partOfSpeech}", style: TextStyle(color: Colors.black, fontSize: 20),),
                //           // You can display other data fields here if needed
                //         );
                //       },
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          Obx(() {
            return Visibility(
              visible: controller.isLoading.value,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          })
        ],
      ),
    );
  }
}
