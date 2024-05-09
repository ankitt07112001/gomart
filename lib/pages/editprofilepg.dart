// import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gomart/api_controller/editProfileController.dart';
import 'package:gomart/api_controller/url.dart';
import 'package:gomart/pages/SettingsPage.dart';
import 'package:gomart/pages/profile_desing.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:permission_handler/permission_handler.dart';

class Myeditprofile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  File? pickedImage;
  File? imagefile;
  var box = GetStorage();
  var myController = Get.put(EditProfileController());
  var _formkey = GlobalKey<FormState>();

  // TextEditingController nameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();

  // void imagePickerOption() {
  //   Get.bottomSheet(
  //     SingleChildScrollView(
  //       child: ClipRRect(
  //         borderRadius: const BorderRadius.only(
  //           topLeft: Radius.circular(10.0),
  //           topRight: Radius.circular(10.0),
  //         ),
  //         child: Container(
  //           color: Colors.white,
  //           height: 250,
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.stretch,
  //               children: [
  //                 const Text(
  //                   "Pic Image From",
  //                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //                   textAlign: TextAlign.center,
  //                 ),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 ElevatedButton.icon(
  //                   onPressed: () {
  //                     pickImage(ImageSource.camera);
  //                   },
  //                   icon: const Icon(Icons.camera),
  //                   label: const Text("CAMERA"),
  //                 ),
  //                 ElevatedButton.icon(
  //                   onPressed: () {
  //                     pickImage(ImageSource.gallery);
  //                   },
  //                   icon: const Icon(Icons.image),
  //                   label: const Text("GALLERY"),
  //                 ),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 ElevatedButton.icon(
  //                   onPressed: () {
  //                     Get.back();
  //                   },
  //                   icon: const Icon(Icons.close),
  //                   label: const Text("CANCEL"),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // pickImage(ImageSource imageType) async {
  //   try {
  //     final photo = await ImagePicker().pickImage(source: imageType);
  //     if (photo == null) return;
  //     final tempImage = File(photo.path);
  //     setState(() {
  //       pickedImage = tempImage;
  //       Box.write('Image', pickedImage);
  //     });

  //     Get.back();
  //   } catch (error) {
  //     debugPrint('Error picking image: $error');
  //   }
  // }

  void initState() {
    myController.getEditProfile();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: myController.showSpinner,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.green,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.green,
              ),
              onPressed: () {
                Get.to(SettingsPage());
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        child: box.read("image") == null
                            ? Image.asset(
                                "assets/images/profile.png",
                                height: 100,
                                width: 100,
                              )
                            : ClipOval(
                                child: Image.file(
                                  // myController.imageedit,
                                  box.read("image"),
                                  // imageurl + myController.UserProfileList[0].profile,
                                  // imagefile!,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () async {
                              print("heloo");
                              // imagePickerOption();
                              Map<Permission, PermissionStatus> status = await [
                                Permission.storage,
                                Permission.camera,
                              ].request();
                              if (status[Permission.storage]!.isGranted &&
                                  status[Permission.camera]!.isGranted) {
                                showImagePicker(context);
                              } else {
                                Get.snackbar(
                                    "error", "permission not garanted");
                              }
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                                color: Colors.green,
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                TextField(
                  controller: myController.name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                TextField(
                  controller: myController.email,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                  ),
                ),
                SizedBox(height: 35),
                TextFormField(
                  controller: myController.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone no.',
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number is required';
                    }
                    if (value.length < 10) {
                      return 'Please enter a valid phone';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("CANCEL",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.black)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("email" + myController.email.toString());
                        print("name" + myController.name.toString());
                        print("phone" + myController.phone.toString());
                        print("image" + box.read("image").toString());
                        myController.editProfileApi();

                        // print("image" + box.read("image").toString());
                        // Get.back();
                        Get.to(profile(visible: true));
                        // if (_formkey.currentState!.validate()) {
                        //
                        // }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  final pick = ImagePicker();
  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Card(
            child: Container(
              height: MediaQuery.sizeOf(context).height * .2.h,
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.all(12),
              child: Row(children: [
                Expanded(
                    child: InkWell(
                  onTap: () {
                    _imgFromGallery();
                    Navigator.pop(context);
                  },
                  child: Column(children: [
                    Icon(
                      Icons.image,
                      size: 60,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Gallery")
                  ]),
                )),
                Expanded(
                    child: InkWell(
                  onTap: () {
                    _imgFromCamera();
                    Navigator.pop(context);
                  },
                  child: Column(children: [
                    Icon(
                      Icons.camera,
                      size: 60,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Camera")
                  ]),
                ))
              ]),
            ),
          );
        });
  }

  _imgFromGallery() async {
    await pick
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  _imgFromCamera() async {
    await pick
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  _cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imagefile = File(croppedFile.path);
        box.write("image", imagefile);
        myController.imageedit = imagefile;
      });
    }
  }
}
