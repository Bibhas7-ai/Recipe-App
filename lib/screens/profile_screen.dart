import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food/provider/profile_provider.dart';
import 'package:food/constants/constant_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.fetchUserData();
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Profile Page'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      backgroundColor: ConstantColors.backgroundColor,
      body: userProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : userProvider.errorMessage != null
              ? Center(child: Text(userProvider.errorMessage!))
              : userProvider.userData != null
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                userProvider.userData!['image'] ?? ''),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Name: ${userProvider.userData!['firstName']} ${userProvider.userData!['lastName']}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Email: ${userProvider.userData!['email']}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Phone: ${userProvider.userData!['phone']}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Address: ${userProvider.userData!['address']['city']}, ${userProvider.userData!['address']['street']}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  : const Center(
                      child: Text('No user data available'),
                    ),
    );
  }
}
