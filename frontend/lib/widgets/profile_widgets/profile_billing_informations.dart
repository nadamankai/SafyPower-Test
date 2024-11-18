import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileBillingInformations extends StatefulWidget {
  @override
  _ProfileBillingInformationsState createState() =>
      _ProfileBillingInformationsState();
}

class _ProfileBillingInformationsState
    extends State<ProfileBillingInformations> {
  List<Map<String, String>> billingList = [
    {
      'name': 'Oliver Liam',
      'company': 'Look Design',
      'email': 'company@company.fr',
      'vatNumber': 'FR9864983',
    },
    {
      'name': 'Emma Smith',
      'company': 'Creative Studio',
      'email': 'emma@creativestudio.com',
      'vatNumber': 'FR5623789',
    },
    // Add more billing information entries as needed
  ];

  void _deleteBillingItem(int index) {
    setState(() {
      billingList.removeAt(index);
    });
  }

  void _editBillingItem(int index) async {
    final editedBilling = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        final nameController = TextEditingController(
            text: billingList[index]['name']);
        final companyController = TextEditingController(
            text: billingList[index]['company']);
        final emailController = TextEditingController(
            text: billingList[index]['email']);
        final vatNumberController = TextEditingController(
            text: billingList[index]['vatNumber']);

        return AlertDialog(
          title: const Text('Edit Billing Information'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: companyController,
                decoration: const InputDecoration(labelText: 'Company'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: vatNumberController,
                decoration: const InputDecoration(labelText: 'VAT Number'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop({
                  'name': nameController.text,
                  'company': companyController.text,
                  'email': emailController.text,
                  'vatNumber': vatNumberController.text,
                });
              },
              child: const Text('SAVE'),
            ),
          ],
        );
      },
    );

    if (editedBilling != null) {
      setState(() {
        billingList[index] = editedBilling;
      });
    }
  }

  Widget buildBillingInformation(
    String name,
    String company,
    String email,
    String vatNumber,
    bool isMobile,
    BuildContext context,
    int index,
  ) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(0, 0, 20, 20),
      decoration: BoxDecoration(
        color: const Color(0xffF2F6FE),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 7),
              Row(
                children: [
                  const Text('Company name'),
                  Text(
                    ': $company',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Text('Email'),
                  Text(
                    ': $email',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Text('VAT Number'),
                  Text(
                    ': $vatNumber',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              if (isMobile)
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width - 140,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () => _deleteBillingItem(index),
                        icon: SvgPicture.asset(
                          'assets/svg/trash.svg',
                          colorFilter: const ColorFilter.mode(
                            Color(0xffFF698A),
                            BlendMode.srcIn,
                          ),
                          width: 15,
                        ),
                        label: const Text(
                          'DELETE',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xffFF698A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => _editBillingItem(index),
                        icon: SvgPicture.asset(
                          'assets/svg/edit.svg',
                          width: 17,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          if (!isMobile)
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: () => _deleteBillingItem(index),
                    icon: SvgPicture.asset(
                      'assets/svg/trash.svg',
                      colorFilter: const ColorFilter.mode(
                        Color(0xffFF698A),
                        BlendMode.srcIn,
                      ),
                      width: 15,
                    ),
                    label: const Text(
                      'DELETE',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xffFF698A),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => _editBillingItem(index),
                    icon: SvgPicture.asset(
                      'assets/svg/edit.svg',
                      width: 17,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final isMobile = maxWidth < 600;
    return Container(
      height: 300,
      padding: isMobile
          ? const EdgeInsets.only(bottom: 10, top: 10, left: 20, right: 0)
          : const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Billing information',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 19,
            ),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: ListView.builder(
              itemCount: billingList.length,
              itemBuilder: (context, index) {
                final billingInfo = billingList[index];
                return buildBillingInformation(
                  billingInfo['name'] ?? '',
                  billingInfo['company'] ?? '',
                  billingInfo['email'] ?? '',
                  billingInfo['vatNumber'] ?? '',
                  isMobile,
                  context,
                  index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
