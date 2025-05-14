import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/screen/edit_profiile_screen.dart';
import 'package:plant_app/screen/signup_screen.dart';

import '../supabase/supabase_services.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({super.key});

  String name = '';
  String email = '';

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildProfileImage(100, 100),
                SizedBox(width: screenWidth * 0.06),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your name',
                      style: TextStyle(
                        fontSize: 22, // Larger font size
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Your email',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.10),
            Wrap(
              runSpacing: 20,
              children: [
                _buildCardOption(
                  icon: Iconsax.user,
                  title: "My Account",
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: EditProfileScreen(),
                        duration: const Duration(milliseconds: 600),
                      ),
                    );
                  },
                ),
                _buildCardOption(
                  icon: Iconsax.shopping_bag,
                  title: "My Orders",
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Check your order in Cart screen'),
                      ),
                    );
                  },
                ),
                _buildCardOption(
                  icon: Iconsax.logout,
                  title: "Log Out",
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Log out successfully')),
                    );
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: SignupScreen(),
                        duration: const Duration(milliseconds: 600),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardOption({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return Card(
      color: const Color(0xFFE9ECEF),
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.green, size: 22),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16,
          color: Colors.black,
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildProfileImage(double width, double height) {
    return Center(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              // Subtle shadow around the image
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          image: const DecorationImage(
            image: AssetImage('assets/profile.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
