import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:licencias/styles/global_styles.dart';
import 'package:licencias/widgets/main_appbar.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool imageTaken = false;
  late XFile? imageFile;
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: MainAppbar(title: 'Perfil'),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 140,
                width: 140,
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/images/profile.png"),
                    ),
                    Positioned(
                      right: -16,
                      bottom: 0,
                      child: SizedBox(
                        height: 46,
                        width: 46,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: BorderSide(color: Colors.white),
                            ),
                            primary: Colors.white,
                            backgroundColor: CustomColors.lightBlue,
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: ((builder) => Container(
                                    height: 100,
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 20,
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        const Text(
                                          "Elige tu imagen",
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              margin: const EdgeInsets.only(
                                                right: 20,
                                              ),
                                              child: TextButton.icon(
                                                onPressed: () {
                                                  takePhoto(ImageSource.camera);
                                                },
                                                icon: const Icon(
                                                    LineIcons.camera),
                                                label: const Text(
                                                  "Camara",
                                                  style: TextStyle(
                                                    color:
                                                        CustomColors.lightBlue,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                left: 20,
                                              ),
                                              child: TextButton.icon(
                                                onPressed: () {
                                                  takePhoto(
                                                      ImageSource.gallery);
                                                },
                                                icon:
                                                    const Icon(LineIcons.image),
                                                label: const Text(
                                                  "Galería",
                                                  style: TextStyle(
                                                    color:
                                                        CustomColors.lightBlue,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                            );
                          },
                          child: Icon(LineIcons.camera),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 10, right: 10, top: 80),
                  padding: EdgeInsets.only(right: 20, left: 30),
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: CustomColors.optionWhite,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: CustomColors.shadowWhite),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: LineIcon(
                          LineIcons.phone,
                          size: 36,
                          color: CustomColors.subBlue,
                        ),
                      ),
                      Container(
                        child: Text(
                          "+52 55 50** **45",
                          style: TextStyle(
                            color: CustomColors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        child: LineIcon(
                          LineIcons.angleRight,
                          size: 36,
                          color: CustomColors.softGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                  padding: EdgeInsets.only(right: 20, left: 30),
                  alignment: Alignment.center,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: CustomColors.optionWhite,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: CustomColors.shadowWhite),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: LineIcon(
                          LineIcons.envelope,
                          size: 36,
                          color: CustomColors.subBlue,
                        ),
                      ),
                      Container(
                        child: Text(
                          "carr*******82@hotmail.com",
                          style: TextStyle(
                            color: CustomColors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        child: LineIcon(
                          LineIcons.angleRight,
                          size: 36,
                          color: CustomColors.softGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                  padding: EdgeInsets.only(right: 20, left: 30),
                  alignment: Alignment.center,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: CustomColors.optionWhite,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: CustomColors.shadowWhite),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: LineIcon(
                          LineIcons.key,
                          size: 36,
                          color: CustomColors.subBlue,
                        ),
                      ),
                      Container(
                        child: Text(
                          "Contraseña de inicio de sesión",
                          style: TextStyle(
                            color: CustomColors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        child: LineIcon(
                          LineIcons.angleRight,
                          size: 36,
                          color: CustomColors.softGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                  padding: EdgeInsets.only(right: 20, left: 30),
                  alignment: Alignment.center,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: CustomColors.optionWhite,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: CustomColors.shadowWhite),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: LineIcon(
                          LineIcons.alternateSignOut,
                          size: 36,
                          color: CustomColors.subBlue,
                        ),
                      ),
                      Container(
                        child: Text(
                          "Cerrar sesión",
                          style: TextStyle(
                            color: CustomColors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        child: LineIcon(
                          LineIcons.angleRight,
                          size: 36,
                          color: CustomColors.softGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(
      source: source,
    );
    setState(() {
      imageTaken = true;
      imageFile = pickedFile;
      uploadImage(imageFile!);
      Navigator.pop(context);
    });
  }

  Future<void> uploadImage(XFile pickedFile) async {
    String filePath = pickedFile.path;
    //await uploadFile(filePath);
    imageTaken = true;
  }
}
