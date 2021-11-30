import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:cubit_template/Helpers/hivr_helper.dart';
import 'package:cubit_template/generated/l10n.dart';
import 'package:cubit_template/res/m_colors.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({Key? key}) : super(key: key);


  @override
  _LanguagesScreenState createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  List<String> appLanguages = ['ar', 'en'];
  String? selectedLocal;
  int? value;

  @override
  void initState() {
    super.initState();
    selectedLocal = Hive.box(HiveHelper.KEY_BOX_APP_LANGUAGE)
            .get(HiveHelper.KEY_BOX_APP_LANGUAGE) ?? appLanguages[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).app_language,
          style: const TextStyle(color: Colors.black87),
        ),
        leading:
        InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(CupertinoIcons.back,color: MColors.colorPrimarySwatch,)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: buildBody(context, appLanguages),
    );
  }

  Widget buildBody(BuildContext context, List<String> languages) {

    double mHeight = MediaQuery.of(context).size.height;
    double mWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(mWidth * 0.02),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(14)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                elevation: 0,
                color: value == index || selectedLocal == languages[index]
                    ? Theme.of(context).primaryColor.withOpacity(0.15)
                    : Colors.white,
                child: RadioListTile(
                  activeColor: Theme.of(context).primaryColor,
                  value: index,
                  groupValue: value,
                  selectedTileColor:
                      Theme.of(context).primaryColor.withOpacity(0.01),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 0.7,
                        color:
                            value == index || selectedLocal == languages[index]
                                ? Theme.of(context).primaryColor
                                : Colors.white),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  onChanged: (ind) => setState(() {
                    value = ind as int?;
                    selectedLocal = languages[index];
                  }),
                  title: Text(
                    languages[index].toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
            itemCount: languages.length,
          ),
          Positioned(
              bottom: 0,
              child: Container(
                margin: EdgeInsets.all(mWidth * 0.02),
                child: MaterialButton(
                  onPressed: () async {
                    if (HiveHelper.mobileLanguage.value !=
                        Locale(selectedLocal!)) {
                      HiveHelper.mobileLanguage.value =
                           Locale(selectedLocal!);
                    }
                    await Hive.box(HiveHelper.KEY_BOX_APP_LANGUAGE)
                        .put(HiveHelper.KEY_BOX_APP_LANGUAGE, selectedLocal);
                    Get.updateLocale(Locale(selectedLocal!));
                    setState(() {

                    });
                    FocusScope.of(context).unfocus();
                    Navigator.pop(context);
                  },
                  height: mHeight * .07,
                  minWidth: mWidth * 0.84,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: Theme.of(context).primaryColor,
                  child:  Text(
                    S.of(context).submit,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 16),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
