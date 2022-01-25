import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kafey/CommonUtils/image_loader.dart';
import 'package:kafey/UI/main_screens/home/cubit/home_cubit.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/m_colors.dart';
import 'package:kafey/res/styles.dart';

class CustomDrawer extends StatelessWidget {
  final HomeCubit cubit;

  CustomDrawer(this.cubit);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(26), bottomLeft: Radius.circular(26)),
      child: Drawer(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: MColors.gradientColors,
            )
        ),
        child: Container(
          margin: EdgeInsets.only(top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,

                  border: Border.all(
                    color: Color(0xff0077ff),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80.0),
                  child: ImageLoader.loadDefaultA(
                      'https://images.ctfassets.net/lh3zuq09vnm2/yBDals8aU8RWtb0xLnPkI/19b391bda8f43e16e64d40b55561e5cd/How_tracking_user_behavior_on_your_website_can_improve_customer_experience.png',
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.fill),
                ),
              ),
              Column(

                children: [
                  Text(
                    "محمد شعيب ",
                    style: KStyles.textWhiteStyle22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: 4,
                        color: Colors.white,
                      ),
                      Gaps.hGap10,
                      Text("مصمم جرافك", style: KStyles.textWhiteStyle14),
                    ],
                  ),
                ],
              ),
              Gaps.vGap12,

              Column(

                children: [
                  Text(
                    "تاريخ التعيين",
                    style: KStyles.textWhiteStyle22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: 4,
                        color: Colors.white,
                      ),
                      Gaps.hGap10,
                      Text("1-7-2021", style: KStyles.textWhiteStyle14),
                    ],
                  ),
                ],
              ),
              Gaps.vGap12,
              Column(

                children: [
                  Text(
                    "مؤسسة آفاق",
                    style: KStyles.textWhiteStyle22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: 4,
                        color: Colors.white,
                      ),
                      Gaps.hGap10,
                      Text("فرع الرياض", style: KStyles.textWhiteStyle14),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
