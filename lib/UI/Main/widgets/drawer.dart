import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kafey/CommonUtils/image_loader.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
import 'package:kafey/UI/main_screens/home/cubit/home_cubit.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/m_colors.dart';
import 'package:kafey/res/styles.dart';

class CustomDrawer extends StatelessWidget {
  final HomeCubit cubit;

  const CustomDrawer(this.cubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(26), bottomLeft: Radius.circular(26)),
      child: Drawer(
          child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: MColors.gradientColors,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 100),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xff0077ff),
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80.0),
                    child: ImageLoader.loadDefaultA(
                        cubit.mProfileData != null
                            ? cubit.mProfileData!.image!
                            : 'https://images.ctfassets.net/lh3zuq09vnm2/yBDals8aU8RWtb0xLnPkI/19b391bda8f43e16e64d40b55561e5cd/How_tracking_user_behavior_on_your_website_can_improve_customer_experience.png',
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.fill),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      cubit.mProfileData != null
                          ? cubit.mProfileData!.userName!
                          : "",
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
                        Text(
                            cubit.mProfileData != null
                                ? cubit.mProfileData!.empJobTitle!
                                : "",
                            style: KStyles.textWhiteStyle14),
                      ],
                    ),
                  ],
                ),
                Gaps.vGap12,
                Column(
                  children: [
                    const Text(
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
                        Text(
                            cubit.mProfileData != null
                                ? cubit.mProfileData!.empDateOfJoin!
                                : "",
                            style: KStyles.textWhiteStyle14),
                      ],
                    ),
                  ],
                ),
                Gaps.vGap12,
                Column(
                  children: [
                    Text(
                      cubit.mProfileData != null
                          ? cubit.mProfileData!.companyName!
                          : "مؤسسة آفاق",
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
                        Text(
                            cubit.mProfileData != null
                                ? cubit.mProfileData!.empBranch!
                                : "",
                            style: KStyles.textWhiteStyle14),
                      ],
                    ),
                  ],
                ),
                Gaps.vGap50,
                InkWell(
                  onTap: () {
                    cubit.doLogoutApiCall();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: 4,
                        color: Colors.white,
                      ),
                      Gaps.hGap10,
                      const Text("تسجيل الخروج",
                          style: KStyles.textWhiteStyle22),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      " © جميع الحقوق محفوظة",
                      style: KStyles.textWhiteStyle14,
                    ),
                    Gaps.hGap10,
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset(
                        ImageUtils.getSVGPath("ic_kafey_logo"),
                        height: 25,
                        width: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
