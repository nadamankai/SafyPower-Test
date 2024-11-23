import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileInformation extends StatefulWidget {
  const ProfileInformation({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  final String name;
  final String email;

  @override
  _ProfileInformationState createState() => _ProfileInformationState();
}

class _ProfileInformationState extends State<ProfileInformation> with SingleTickerProviderStateMixin {
  bool isEditing = false;
  late TabController _tabController;

  Map<String, String> profileFields = {
    'Fullname': 'Omar Hiopil',
    'Mobile phone': '+33 656 64 14 18',
    'Email': 'email.mail@gmail.fr',
    'Address': '23 voie du succès 3000',
  };

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Initialize text controllers with current profile data
    _fullNameController.text = profileFields['Fullname']!;
    _mobileController.text = profileFields['Mobile phone']!;
    _emailController.text = profileFields['Email']!;
    _addressController.text = profileFields['Address']!;
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isWeb = !isMobile;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Profile Information Section with toggleable content
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              widget.name,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: isMobile ? 22 : 26,
                color: const Color(0xFF333333),
              ),
            ),
            subtitle: Text(
              widget.email,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: isMobile ? 14 : 16,
                color: const Color(0xFF666666),
              ),
            ),
            leading: CircleAvatar(
              radius: isMobile ? 35 : 50,
              backgroundImage: const AssetImage('assets/logo.png'),
              backgroundColor: Colors.transparent,
            ),
          ),
          const Divider(color: Color(0xFFE0E0E0), thickness: 1),
          SizedBox(height: 20),
          // TabBar and TabBarView for tab navigation
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: isMobile ? 'Info' : 'Profile Information'),
              Tab(text: isMobile ? 'Settings' : 'Profile Settings'),
            ],
            labelColor: Colors.blueAccent,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blueAccent,
          ),
          SizedBox(height: 20),
          Container(
            height: 400,
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildProfileInformationTab(),
                _buildProfileSettingsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Build the Profile Information Tab
  Widget _buildProfileInformationTab() {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Edit Button
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton.icon(
              icon: Icon(
                isEditing ? Icons.save : Icons.edit,
                size: isMobile ? 20 : 25,
              ),
              label: Text(isEditing ? 'Save Changes' : 'Edit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                setState(() {
                  if (isEditing) {
                    // Save changes and exit edit mode
                    profileFields['Fullname'] = _fullNameController.text;
                    profileFields['Mobile phone'] = _mobileController.text;
                    profileFields['Email'] = _emailController.text;
                    profileFields['Address'] = _addressController.text;
                  }
                  isEditing = !isEditing;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          // Profile Fields
          ...profileFields.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12 , left:20 , right: 20 ,),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Reduced horizontal spacing between label and value/input
                  SizedBox(
                    width: isMobile ? 160 : 130, // Adjust width for web and mobile
                    child: Text(
                      entry.key,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: isMobile ? 14 : 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8), // Small gap between label and value
                  isEditing
                      ? _buildEditableField(entry.key)
                      : _buildProfileDetail(entry.value, isMobile),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  // Builds the editable TextField based on the key
  Widget _buildEditableField(String key) {
    // Fixed width for input fields
    const inputWidth = 250.0;

    switch (key) {
      case 'Fullname':
        return Container(
          width: inputWidth,
          child: TextField(
            controller: _fullNameController,
            decoration: _inputDecoration(label: key),
          ),
        );
      case 'Mobile phone':
        return Container(
          width: inputWidth,
          child: TextField(
            controller: _mobileController,
            decoration: _inputDecoration(label: key),
          ),
        );
      case 'Email':
        return Container(
          width: inputWidth,
          child: TextField(
            controller: _emailController,
            decoration: _inputDecoration(label: key),
          ),
        );
      case 'Address':
        return Container(
          width: inputWidth,
          child: TextField(
            controller: _addressController,
            decoration: _inputDecoration(label: key),
          ),
        );
      default:
        return Container();
    }
  }

  // Profile Detail View
  Widget _buildProfileDetail(String value, bool isMobile) {
    return Flexible(
      child: Text(
        value,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          fontSize: isMobile ? 14 : 16,
          color: Colors.black.withOpacity(0.7),
        ),
      ),
    );
  }

  // Common input decoration style for the editable fields
  InputDecoration _inputDecoration({required String label}) {
    return InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: Colors.blueAccent,
      ),
      hintStyle: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Colors.grey,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.blueAccent),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.blueAccent, width: 2),
      ),
    );
  }

  // Settings Tab remains unchanged
  Widget _buildProfileSettingsTab() {
    final isMobile = MediaQuery.of(context).size.width < 600;

    final List<Map<String, dynamic>> settings = [
      {
        'section': 'Account',
        'settings': [
          {'title': 'Email me when someone follows me.', 'value': true},
          {'title': 'Email me when someone answers my post.', 'value': false},
          {'title': 'Email me when someone mentions me.', 'value': true},
        ]
      },
      {
        'section': 'Application',
        'settings': [
          {'title': 'New launches and projects.', 'value': false},
          {'title': 'Monthly product changes.', 'value': false},
          {'title': 'Subscribe to the newsletter.', 'value': true},
        ]
      },
    ];

    return SingleChildScrollView(
      child: Column(
        children: settings.map((setting) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  setting['section'],
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              ...setting['settings'].map<Widget>((settingItem) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Text(
                        settingItem['title'],
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                      Spacer(),
                      Switch(
                        value: settingItem['value'],
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          );
        }).toList(),
      ),
    );
  }
}
