import 'package:byaan/CommonUtils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:byaan/res/m_colors.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({ Key? key, required this.data, this.isSelected = false, this.onTap, this.selectedColor = MColors.actionColor}) : super(key: key);
  final data;
  final Color selectedColor;
  final bool isSelected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return 
      GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              padding:  const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: isSelected ? MColors.red : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: MColors.shadowColor.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(1, 1), // changes position of shadow
                  ),
                ],
                shape: BoxShape.circle
              ),  
              child: SvgPicture.asset(ImageUtils.getImagePath(data["icon"],format: 'svg',folderName: 'icons/category'), color: isSelected ? selectedColor : MColors.textColor, width: 30, height: 30,)
            ),
            const SizedBox(height: 10,),
            Text(data["name"], maxLines: 1, overflow: TextOverflow.fade, 
              style: const TextStyle(color: MColors.textColor, fontWeight: FontWeight.w500),
            )
          ],
        ),
      )
      ;
  }
}