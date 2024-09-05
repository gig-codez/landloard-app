// ignore_for_file: deprecated_member_use, invalid_use_of_visible_for_testing_member

import '/models/User.dart';

import '/exports/exports.dart';
import 'emailVerification.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  EdgeInsets padding =
      const EdgeInsets.only(top: 5, right: 15, left: 15, bottom: 2);
  //
  bool _showpass = false;
  bool _cshowpass = false;
  final formKey = GlobalKey<FormState>();
  // controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  final contactController = TextEditingController();
  final addressController = TextEditingController();
  // end of controllers
  Uint8List? _image;
// function to load image
  void loadImage() {
    ImagePicker.platform.getImage(source: ImageSource.gallery).then((value) {
      value?.readAsBytes().then((value) {
        setState(() {
          _image = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // load png inform of uint8list

    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Space(space: 0.03),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("Sign up",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 30)),
              ),
              AspectRatio(
                aspectRatio: 2.2,
                child: Image.asset("assets/6184498.png"),
              ),
              Padding(
                padding: padding,
                child: Text(
                  "User Profile",
                  style: TextStyles(context).getDescriptionStyle(),
                ),
              ),
              Padding(
                padding: padding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _image != null
                        ?
                        // displaying uploaded image
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.memory(_image!),
                            ),
                          )
                        :
                        // displaying default image
                        SizedBox(
                            width: 70,
                            height: 70,
                            child: Image.asset("assets/default.png")),
                    const Space(space: 0.03),
                    // camera button
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () => loadImage(),
                        icon: const Icon(Icons.camera_alt, size: 30),
                      ),
                    ),
                  ],
                ),
              ),
              CommonTextField(
                titleText: "Name",
                hintText: "John Doe",
                controller: nameController,
                icon: Icons.person,
                enableBorder: true,
                padding: padding,
              ),
              CommonTextField(
                enableBorder: true,
                titleText: "Address",
                hintText: "Kampala, Uganda",
                controller: addressController,
                icon: Icons.location_on,
                padding: padding,
              ),
              CommonTextField(
                enableBorder: true,
                titleText: "Email",
                hintText: "example@gmail.com",
                controller: emailController,
                icon: Icons.email,
                padding: padding,
              ),
              CommonTextField(
                titleText: "Contact",
                hintText: "075xxxx-xxxx-xxxx",
                controller: contactController,
                enableBorder: true,
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                padding: padding,
              ),
              CommonTextField(
                titleText: "Password",
                padding: padding,
                controller: passwordController,
                hintText: "***********",
                enableBorder: true,
                icon: Icons.lock,
                enableSuffix: true,
                suffixIcon: _showpass == false
                    ? Icons.visibility_off_outlined
                    : Icons.remove_red_eye,
                isObscureText: !_showpass,
                onTapSuffix: () {
                  setState(() {
                    _showpass = !_showpass;
                  });
                },
              ),
              CommonTextField(
                titleText: "Confirm Password",
                padding: padding,
                controller: confirmPassController,
                hintText: "***********",
                icon: Icons.lock,
                enableSuffix: true,
                suffixIcon: _cshowpass == false
                    ? Icons.visibility_off_outlined
                    : Icons.remove_red_eye,
                enableBorder: true,
                isObscureText: !_cshowpass,
                onTapSuffix: () {
                  setState(() {
                    _cshowpass = !_cshowpass;
                  });
                },
              ),
              const Space(
                space: 0.03,
              ),
              CommonButton(
                padding: padding,
                height: 50,
                buttonText: "Sign Up",
                textColor: Colors.white,
                backgroundColor: Theme.of(context).colorScheme.primary,
                onTap: () {
                  // check if all fields have data
                  if (nameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      confirmPassController.text.isEmpty ||
                      contactController.text.isEmpty ||
                      addressController.text.isEmpty) {
                    showMessage(
                        context: context,
                        msg: "Please fill all fields",
                        type: 'danger');
                  }
                  showProgress(context, text: "Creation progress");
                  if (formKey.currentState!.validate()) {
                    var user = Landlord(
                        name: nameController.text,
                        email: emailController.text,
                        contact: contactController.text,
                        address: addressController.text,
                        password: passwordController.text,
                        profile: base64.encode(_image!));

                    //creation of the landlord
                    Auth.createLandlord(user, context).then((value) {
                      Routes.pop(context);
                      // on success validate the email
                      Routes.push(const EmailVerificationView(), context);
                    });
                  }
                },
              ),
              const Space(space: 0.03),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40),
                child: Row(
                  children: [
                    Text("Already have an account  |",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.black)),
                    TextButton(
                      onPressed: () => Routes.routeUntil(context, Routes.login),
                      child: const Text(
                        "login",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
