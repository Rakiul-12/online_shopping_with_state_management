import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/common/widgets/Button/elevatedButton.dart';
import 'package:online_shop/common/widgets/loader/circularLoader.dart';
import 'package:online_shop/common/widgets/text/sectionHeading.dart';
import 'package:online_shop/data/repository/address/addressRepository.dart';
import 'package:online_shop/features/personalization/models/addressModel.dart';
import 'package:online_shop/features/personalization/screen/Address/AddNewAddress.dart';
import 'package:online_shop/features/personalization/screen/Address/widgets/MySingleAddress.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/helpers/NetworkManager.dart';
import 'package:online_shop/utile/helpers/cloudHelperFunction.dart';
import 'package:online_shop/utile/popup/fullScreenLoader.dart';
import 'package:online_shop/utile/popup/snackbarHelpers.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final _repository = Get.put(AddressRepository());

  Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  RxBool refreshData = false.obs;
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();

  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();


  // function to add new address
  Future<void> addNewAddress() async {
    try {

      MyFullScreenLoader.openLoadingDialog("Storing Address...");

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        MyFullScreenLoader.stopLoading();
        return;
      }

      if (!addressFormKey.currentState!.validate()) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      AddressModel address = AddressModel(
          id: "",
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          postalCode: postalCode.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          country: country.text.trim(),
          dateTime: DateTime.now()
      );

      // save address
      String addressId = await _repository.addAddress(address);

      // update address id
      address.id = addressId;

      selectAddress(address);

      MyFullScreenLoader.stopLoading();
      MySnackBarHelpers.successSnackBar(title: "Congratulation", message: "Your address has been saved successfully");

      // refresh address data
      refreshData.toggle();

      // reset field
      name.clear();
      phoneNumber.clear();
      street.clear();
      postalCode.clear();
      city.clear();
      state.clear();
      country.clear();
      addressFormKey.currentState!.reset();

      // get back to the address screen
      Navigator.pop(Get.context!);
      Navigator.pop(Get.context!);

    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MySnackBarHelpers.errorSnackBar(title: "Failed",message: e.toString());
    }
  }

  // function to fetch the address
  Future<List<AddressModel>> getAllAddress() async {
    try {
      List<AddressModel> addresses = await _repository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere((address) => address.selectAddress,orElse: ()=> AddressModel.empty());
      return addresses;
    } catch (e) {
      MySnackBarHelpers.errorSnackBar(title: "Failed",message: e.toString());
      return [];
    }
  }

  // function to select address
  Future<void> selectAddress (AddressModel newSelectedAddress) async{
    try{
      // start loading
      Get.defaultDialog(
        title: "",
        onWillPop: () async => false,
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: MyCircularLoader()
      );

      // unselect the already selected address
      if(selectedAddress.value.id.isNotEmpty){
        await _repository.updateSelectedAddresses(selectedAddress.value.id, false);
      }

      // assign selected address
      newSelectedAddress.selectAddress = true;
      selectedAddress.value = newSelectedAddress;

      // set the selected address to true in the firebase

      await _repository.updateSelectedAddresses(selectedAddress.value.id, true);

      Get.back();
    }catch(e){
      Get.back();
      MySnackBarHelpers.errorSnackBar(title: "Failed",message: e.toString());
    }
  }

  // function to show bottom sheet to select address
  Future<void> selectNewAddressBottomSheet(BuildContext context){
    return showModalBottomSheet(context: context, builder: (context) => Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(Mysize.lg),
            child: Column(
              children: [
                MySectionHeading(title: "Select Address",showActionBtn: false,),
                SizedBox(height: Mysize.spaceBtwItems),
                FutureBuilder(
                    future: getAllAddress(),
                    builder: (context, snapshot) {
                      final widget = myCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                      if(widget != null) return widget;
                      return ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => SizedBox(height: Mysize.spaceBtwItems),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) => MySingleAddress(address: snapshot.data![index], onTap: (){
                            selectAddress(snapshot.data![index]);
                            Get.back();
                          }),
                      );
                    },
                ),
                SizedBox(height: Mysize.spaceBtwSections)
              ],
            ),
          ),
        ),
        
        Positioned(
          bottom: Mysize.defaultSpace,
          right: Mysize.defaultSpace * 2,
          left: Mysize.defaultSpace * 2,
            child: MyElevatedButton(onPressed: ()=> Get.to(()=> addNewAddressScreen()) , child: Text("Add New Address"))
        )
      ],
    ),);
  }


}