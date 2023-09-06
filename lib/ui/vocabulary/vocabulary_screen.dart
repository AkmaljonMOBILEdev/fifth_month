import 'package:fifth_month/data/network/api_service.dart';
import 'package:fifth_month/getx/vocabulary_controller/vocabulary_controller.dart';
import 'package:fifth_month/ui/vocabulary/widgets/search.dart';
import 'package:fifth_month/ui/vocabulary/widgets/word_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  String holder = "";
  TextEditingController text =TextEditingController();
  VocabularyController controller = Get.put(VocabularyController(apiService: ApiService()));

  @override
  void initState() {
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Vocabulary"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        children: [
          SearchWord(
            controller: text,
            onTap: () {
              holder = text.text;
              debugPrint(holder);
              controller.getMeaningOfWord(holder);
            },
          ),
          Visibility(
              visible: controller.isLoading.value,
              child: const Center(child: CircularProgressIndicator(),)),
          Obx(() {
            return SizedBox(
              height: 500,
              child: ListView.builder(
                  itemCount: controller.meanings.length,
                  itemBuilder: (context, index) {
                    return WordHolder(meaningModel: controller.meanings[index]);
                  }),
            );
          })
        ],
      ),
    );
  }
}
