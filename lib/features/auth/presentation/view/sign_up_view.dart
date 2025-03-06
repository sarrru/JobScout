// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:job_scout_project/features/auth/presentation/view/login_view.dart';
// import 'package:job_scout_project/features/auth/presentation/view_model/signup/register_bloc.dart';
// import 'package:permission_handler/permission_handler.dart';

// class SignUpView extends StatefulWidget {
//   const SignUpView({super.key});

//   @override
//   State<SignUpView> createState() => _SignUpViewState();
// }

// class _SignUpViewState extends State<SignUpView> {
//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _contactNoController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isPasswordVisible = false;

//   checkCameraPermission() async {
//     if (await Permission.camera.request().isRestricted ||
//         await Permission.camera.request().isDenied) {
//       await Permission.camera.request();
//     }
//   }

//   File? _img;
//   Future _browseImage(ImageSource imageSource) async {
//     try {
//       final image = await ImagePicker().pickImage(source: imageSource);
//       if (image != null) {
//         setState(() {
//           _img = File(image.path);
//           context.read<RegisterBloc>().add(
//                 LoadImage(file: _img!),
//               );
//         });
//       } else {
//         return;
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _emailController.dispose();
//     _contactNoController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   String? _validateUsername(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Username is required';
//     }
//     return null;
//   }

//   String? _validateEmail(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Email is required';
//     } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//       return 'Enter a valid email address';
//     }
//     return null;
//   }

//   String? _validateContact(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Phone number is required';
//     } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
//       return 'Enter a valid 10-digit phone number';
//     }
//     return null;
//   }

//   String? _validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Password is required';
//     } else if (value.length < 6) {
//       return 'Password must be at least 6 characters long';
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text('Sign Up', style: TextStyle(color: Colors.black)),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 16.0),
//                   child: const Text(
//                     'Create Account',
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.purple,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 16.0),
//                   child: const Text(
//                     'Please sign up for a new account',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black54,
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     showModalBottomSheet(
//                       backgroundColor: Colors.grey[300],
//                       context: context,
//                       isScrollControlled: true,
//                       shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.vertical(
//                           top: Radius.circular(20),
//                         ),
//                       ),
//                       builder: (context) => Padding(
//                         padding: const EdgeInsets.all(20),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             ElevatedButton.icon(
//                               onPressed: () {
//                                 checkCameraPermission();
//                                 _browseImage(ImageSource.camera);
//                                 Navigator.pop(context);
//                               },
//                               icon: const Icon(Icons.camera),
//                               label: const Text('Camera'),
//                             ),
//                             ElevatedButton.icon(
//                               onPressed: () {
//                                 _browseImage(ImageSource.gallery);
//                                 Navigator.pop(context);
//                               },
//                               icon: const Icon(Icons.image),
//                               label: const Text('Gallery'),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                   child: Center(
//                     child: SizedBox(
//                       height: 150,
//                       width: 150,
//                       child: CircleAvatar(
//                         radius: 50,
//                         backgroundImage: _img != null
//                             ? FileImage(_img!)
//                             : const AssetImage('assets/images/profile.png')
//                                 as ImageProvider,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20.0),
//                 _buildTextField(
//                   prefixIcon: const Icon(Icons.person),
//                   controller: _usernameController,
//                   hintText: 'Username',
//                   validator: _validateUsername,
//                 ),
//                 _buildTextField(
//                   prefixIcon: const Icon(Icons.phone),
//                   controller: _contactNoController,
//                   hintText: 'Phone',
//                   validator: _validateContact,
//                 ),
//                 _buildTextField(
//                   prefixIcon: const Icon(Icons.email),
//                   controller: _emailController,
//                   hintText: 'Email',
//                   validator: _validateEmail,
//                 ),
//                 _buildTextField(
//                   prefixIcon: const Icon(Icons.lock),
//                   controller: _passwordController,
//                   hintText: 'Password',
//                   validator: _validatePassword,
//                   obscureText: !_isPasswordVisible,
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _isPasswordVisible
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                       color: Colors.black,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _isPasswordVisible = !_isPasswordVisible;
//                       });
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 24.0),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         final registerState =
//                             context.read<RegisterBloc>().state;
//                         final imageName = registerState.imageName;
//                         context.read<RegisterBloc>().add(
//                               RegisterUserEvent(
//                                 context: context,
//                                 username: _usernameController.text,
//                                 email: _emailController.text,
//                                 contactNo: _contactNoController.text,
//                                 password: _passwordController.text,
//                                 image: imageName,
//                               ),
//                             );
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.purple,
//                       shape: RoundedRectangleBorder(
//                         borderRadius:
//                             BorderRadius.circular(10.0), // Rounded corners
//                       ),
//                     ),
//                     child: const Text(
//                       'REGISTER',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 8.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'Already have an account?',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const LoginView()),
//                         );
//                       },
//                       child: const Text(
//                         'Login here',
//                         style: TextStyle(
//                           color: Colors.purple,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Padding _buildTextField({
//     required TextEditingController controller,
//     required String hintText,
//     required String? Function(String?) validator,
//     bool obscureText = false,
//     Widget? prefixIcon,
//     Widget? suffixIcon,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: const Color.fromARGB(255, 236, 233, 233),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: TextFormField(
//           controller: controller,
//           obscureText: obscureText,
//           decoration: InputDecoration(
//             suffixIcon: suffixIcon,
//             prefixIcon: prefixIcon,
//             hintText: hintText,
//             border: const OutlineInputBorder(
//               borderSide: BorderSide.none,
//             ),
//           ),
//           validator: validator,
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_scout_project/features/auth/presentation/view/login_view.dart';
import 'package:job_scout_project/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactNoController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  File? _img;

  Future<void> checkCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isDenied || status.isRestricted) {
      await Permission.camera.request();
    }
  }

  Future<void> _browseImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;

      setState(() {
        _img = File(image.path);
        context.read<RegisterBloc>().add(LoadImage(file: _img!));
      });
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _contactNoController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateUsername(String? value) =>
      (value == null || value.isEmpty) ? 'Username is required' : null;

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validateContact(String? value) {
    if (value == null || value.isEmpty) return 'Phone number is required';
    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 6) return 'Password must be at least 6 characters long';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Sign Up', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Please sign up for a new account',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 16),
                InkWell(
                  key: const Key('profileImagePicker'),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) => Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton.icon(
                              key: const Key('cameraButton'),
                              onPressed: () async {
                                await checkCameraPermission();
                                await _browseImage(ImageSource.camera);
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.camera),
                              label: const Text('Camera'),
                            ),
                            ElevatedButton.icon(
                              key: const Key('galleryButton'),
                              onPressed: () async {
                                await _browseImage(ImageSource.gallery);
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.image),
                              label: const Text('Gallery'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: _img != null
                          ? FileImage(_img!)
                          : (kIsWeb ||
                                  Platform.environment
                                      .containsKey('FLUTTER_TEST'))
                              ? null
                              : const AssetImage('assets/images/profile.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                _buildTextField(
                  controller: _usernameController,
                  hintText: 'Username',
                  validator: _validateUsername,
                  prefixIcon: const Icon(Icons.person),
                ),
                _buildTextField(
                  controller: _contactNoController,
                  hintText: 'Phone',
                  validator: _validateContact,
                  prefixIcon: const Icon(Icons.phone),
                ),
                _buildTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  validator: _validateEmail,
                  prefixIcon: const Icon(Icons.email),
                ),
                _buildTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  validator: _validatePassword,
                  obscureText: !_isPasswordVisible,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() => _isPasswordVisible = !_isPasswordVisible);
                    },
                  ),
                ),
                const SizedBox(height: 24.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final registerState =
                            context.read<RegisterBloc>().state;
                        context.read<RegisterBloc>().add(
                              RegisterUserEvent(
                                context: context,
                                username: _usernameController.text,
                                email: _emailController.text,
                                contactNo: _contactNoController.text,
                                password: _passwordController.text,
                                image: registerState.imageName,
                              ),
                            );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?',
                        style: TextStyle(color: Colors.black)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginView()));
                      },
                      child: const Text('Login here',
                          style: TextStyle(color: Colors.purple)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildTextField({
  required TextEditingController controller,
  required String hintText,
  required String? Function(String?) validator,
  bool obscureText = false,
  Widget? prefixIcon,
  Widget? suffixIcon,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black54), // Light hint color
        filled: true,
        fillColor: const Color(0xFFE6E6E6), // Light gray background
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none, // No border for default state
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.grey, // Default border color
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.purple, // Highlighted border when focused
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.red, // Red border when error occurs
            width: 2.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.red, // Red border when error and focused
            width: 2.0,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
      ),
      validator: validator,
    ),
  );
}
