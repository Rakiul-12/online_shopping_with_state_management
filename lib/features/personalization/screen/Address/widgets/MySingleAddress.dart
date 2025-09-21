import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/features/personalization/controller/addressController.dart';
import 'package:online_shop/features/personalization/models/addressModel.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';
import '../../../../../common/widgets/custom_shapes/rounded_container.dart';
import '../../../../../utile/const/colors.dart';
import '../../../../../utile/const/sizes.dart';

class MySingleAddress extends StatelessWidget {
  const MySingleAddress({
    super.key,
    required this.address, required this.onTap,
  });

  final AddressModel address;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunction.isDarkMode(context);
    final controller = AddressController.instance;
    return Obx((){
      String selectedAddressId = controller.selectedAddress.value.id;
      bool isSelected = selectedAddressId == address.id;
      return InkWell(
        onTap: onTap,
        child: MyRoundedContainer(
            width: double.infinity,
            borderColor: isSelected ? Colors.transparent : dark ?  Mycolors.darkGrey : Mycolors.grey,
            backgroundColor: isSelected ? Mycolors.primary.withValues(alpha: .5) : Colors.transparent,
            showBorder: true,
            padding: EdgeInsets.all(Mysize.md),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(address.name,style: Theme.of(context).textTheme.titleLarge,maxLines: 1,overflow: TextOverflow.ellipsis,),
                    SizedBox(height: Mysize.spaceBtwItems /2,),
                    Text(address.phoneNumber,maxLines: 1,overflow: TextOverflow.ellipsis,),
                    SizedBox(height: Mysize.spaceBtwItems /2,),
                    Text(address.toString())
                  ],
                ),
                if(isSelected)
                  Positioned(
                      top: 0,
                      bottom: 0,
                      right: 6,
                      child: Icon(Iconsax.tick_circle5))
              ],
            )
        ),
      );
    });
  }
}