import 'package:flutter/material.dart';
import 'package:onlineshopping/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<UserProvider>(context);
    // String username = productProvider.getUserName() ?? 'John Doe';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(productProvider.user!.photoUrl),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productProvider.user!.username,
                        style:const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        productProvider.user!.email,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'A short bio about John Doe. Passionate about mobile development and loves to explore new technologies.',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle edit profile button press
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
