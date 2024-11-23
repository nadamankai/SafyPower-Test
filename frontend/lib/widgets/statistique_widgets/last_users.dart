import 'package:flutter/material.dart';

class LastUser extends StatefulWidget {
  @override
  _LastUserState createState() => _LastUserState();
}

class _LastUserState extends State<LastUser> {
  int hoveredRowIndex = -1;

  final List<Map<String, String>> userData = [
    {"trackingNo": "#876364", "rating": "4", "startTime": "07:00 am", "endTime": "09:00 am"},
    {"trackingNo": "#987654", "rating": "4", "startTime": "03:00 pm", "endTime": "04:00 pm"},
    {"trackingNo": "#345678", "rating": "3", "startTime": "03:00 pm", "endTime": "04:00 pm"},
    {"trackingNo": "#345678", "rating": "4", "startTime": "03:00 pm", "endTime": "04:00 pm"},
    {"trackingNo": "#345678", "rating": "2", "startTime": "03:00 pm", "endTime": "04:00 pm"},
    {"trackingNo": "#345678", "rating": "5", "startTime": "03:00 pm", "endTime": "04:00 pm"},
    {"trackingNo": "#345678", "rating": "4", "startTime": "03:00 pm", "endTime": "04:00 pm"},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 870;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Individual user tracking',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _buildTableCell('Tracking No', isMobile, 0.10, true),
                        _buildTableCell('Start time', isMobile, 0.10, true),
                        _buildTableCell('End Time', isMobile, 0.10, true),
                        _buildTableCell('Charging Time', isMobile, 0.10, true),
                        _buildTableCell('Rating', isMobile, 0.16, true),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 10),
                    ...userData.asMap().entries.map((entry) {
                      final rowIndex = entry.key;
                      final data = entry.value;
                      return _buildUserData(
                        data['trackingNo']!,
                        data['rating']!,
                        data['startTime']!,
                        data['endTime']!,
                        rowIndex,
                        screenWidth,
                        isMobile,
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableCell(String text, bool isMobile, double widthFraction, bool isBold) {
    return Container(
      width: MediaQuery.of(context).size.width * (isMobile ? widthFraction * 1.5 : widthFraction),
      child: Text(
        text,
        style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }

  Widget _buildUserData(
      String trackingNo,
      String rating,
      String startTime,
      String endTime,
      int rowIndex,
      double screenWidth,
      bool isMobile,
      ) {
    bool isHovered = rowIndex == hoveredRowIndex;

    return InkWell(
      onTap: () {
        // Gérer l'action au clic
      },
      onHover: (hovering) {
        setState(() => hoveredRowIndex = hovering ? rowIndex : -1);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: isMobile ? 10 : 20),
        margin: EdgeInsets.only(right: isMobile ? 15 : 30),
        decoration: BoxDecoration(
          color: isHovered ? const Color(0xFFf2f6fe) : null,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            _buildTableCell(trackingNo, isMobile, 0.10, false),
            _buildTableCell(startTime, isMobile, 0.10, false),
            _buildTableCell(endTime, isMobile, 0.10, false),
            Container(
              margin: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 16),
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              child: const Text('2 hours'),
            ),
            _buildRatingStars(int.parse(rating)),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingStars(int rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          color: index < rating
              ? const Color.fromRGBO(254, 221, 105, 1)
              : const Color.fromRGBO(217, 217, 217, 1),
        );
      }),
    );
  }
}
