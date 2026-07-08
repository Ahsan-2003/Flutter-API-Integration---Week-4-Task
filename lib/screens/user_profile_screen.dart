import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../services/api_service.dart';
import '../models/user.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  List<User> users = [];
  bool isLoading = true;
  String? errorMessage;
  int selectedUserId = 1;

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  // ========== TASK 2: Fetching User Data ==========
  Future<void> _fetchUsers() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final data = await ApiService.fetchUsers();
      setState(() {
        users = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('👤 User Profiles (Task 2)'),
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: _fetchUsers),
        ],
      ),
      body: _buildBody(),
    );
  }

  // ========== TASK 3: Loading & Error Handling ==========
  Widget _buildBody() {
    if (isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading users...', style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }

    if (errorMessage != null) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 60, color: Colors.red),
              SizedBox(height: 16),
              Text(
                'Failed to Load Users',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(errorMessage!, textAlign: TextAlign.center),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _fetchUsers,
                icon: Icon(Icons.refresh),
                label: Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    // ========== TASK 2: Display User Profile ==========
    return ListView.builder(
      padding: EdgeInsets.all(12),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return _buildUserCard(user);
      },
    );
  }

  Widget _buildUserCard(User user) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () => _showUserDetailDialog(user),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              // ========== Profile Picture ==========
              _buildProfileImage(user.id),
              SizedBox(width: 16),
              // ========== User Details ==========
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '@${user.username}',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.email, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            user.email,
                            style: TextStyle(fontSize: 13),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(Icons.phone, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(user.phone, style: TextStyle(fontSize: 13)),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  // ========== Profile Picture with Placeholder ==========
  Widget _buildProfileImage(int userId) {
    // Using UI Avatars API for profile pictures
    // final String imageUrl = 'https://i.pravatar.cc/150?img=$userId';
    // https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2VSnavHPDNpYxiLiJKFMPG36dPFBmCp41rz9nxjkvag&s=10

    Image.network(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2VSnavHPDNpYxiLiJKFMPG36dPFBmCp41rz9nxjkvag&s=10',
      height: 100,
      width: 100,
      fit: BoxFit.cover,
    );
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2VSnavHPDNpYxiLiJKFMPG36dPFBmCp41rz9nxjkvag&s=10',
          placeholder: (context, url) => Container(
            color: Colors.grey.shade200,
            child: Icon(Icons.person, size: 35, color: Colors.grey),
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey.shade200,
            child: Icon(Icons.person, size: 35, color: Colors.grey),
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // ========== User Detail Dialog ==========
  void _showUserDetailDialog(User user) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            _buildProfileImage(user.id),
            SizedBox(width: 12),
            Expanded(child: Text(user.name, style: TextStyle(fontSize: 18))),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('Username', '@${user.username}'),
              _buildDetailRow('Email', user.email),
              _buildDetailRow('Phone', user.phone),
              _buildDetailRow('Website', user.website),
              Divider(),
              Text(
                '📍 Address',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 4),
              Text('${user.address.street}, ${user.address.suite}'),
              Text('${user.address.city}, ${user.address.zipcode}'),
              Divider(),
              Text(
                '🏢 Company',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 4),
              Text(
                user.company.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                user.company.catchPhrase,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              Text(user.company.bs, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
