import 'package:flutter/material.dart';

class LastUser extends StatefulWidget {
  @override
  _LastUserState createState() => _LastUserState();
}

class _LastUserState extends State<LastUser> {
  int hoveredRowIndex = -1;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 870;

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 0, top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Individual user tracking',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              _buildTableCell(
                                'Tracking No',
                                isMobile
                                    ? screenWidth * 0.30
                                    : screenWidth * 0.10,
                                true,
                              ),
                              _buildTableCell(
                                'Start time',
                                isMobile
                                    ? screenWidth * 0.30
                                    : screenWidth * 0.10,
                                true,
                              ),
                              _buildTableCell(
                                'End Time',
                                isMobile
                                    ? screenWidth * 0.30
                                    : screenWidth * 0.10,
                                true,
                              ),
                              _buildTableCell(
                                'Charging Time',
                                isMobile
                                    ? screenWidth * 0.40
                                    : screenWidth * 0.10,
                                true,
                              ),
                              _buildTableCell(
                                'Rating',
                                isMobile
                                    ? screenWidth * 0.30
                                    : screenWidth * 0.16,
                                true,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(), // Ligne de séparation
                          const SizedBox(height: 10),
                          _buildUserData('#876364', '4', '07:00 am', '09:00 am',
                              0, screenWidth),
                          _buildUserData('#987654', '4', '03:00 pm', '04:00 pm',
                              1, screenWidth),
                          _buildUserData('#345678', '3', '03:00 pm', '04:00 pm',
                              2, screenWidth),
                          _buildUserData('#345678', '4', '03:00 pm', '04:00 pm',
                              3, screenWidth),
                          _buildUserData('#345678', '2', '03:00 pm', '04:00 pm',
                              4, screenWidth),
                          _buildUserData('#345678', '5', '03:00 pm', '04:00 pm',
                              5, screenWidth),
                          _buildUserData('#345678', '4', '03:00 pm', '04:00 pm',
                              6, screenWidth),
                          // Ajoutez d'autres données ici
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            
          ),
        ],
      ),
    );
  }

  Widget _buildTableCell(String text, double width, bool isBold) {
    return Container(
      width: width,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
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
  ) {
    bool isHovered = rowIndex == hoveredRowIndex;
    final isMobile = screenWidth < 600;

    return InkWell(
      onTap: () {
        // Gérer l'action du clic sur la ligne
      },
      onHover: (value) {
        setState(() {
          if (value) {
            hoveredRowIndex = rowIndex;
          } else {
            hoveredRowIndex = -1;
          }
        });
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
            _buildTableCell(
              trackingNo,
              isMobile ? screenWidth * 0.30 : screenWidth * 0.10,
              false,
            ),
            _buildTableCell(
              startTime,
              isMobile ? screenWidth * 0.30 : screenWidth * 0.10,
              false,
            ),
            _buildTableCell(
              endTime,
              isMobile ? screenWidth * 0.30 : screenWidth * 0.10,
              false,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: isMobile ? 5 : 10,
                  right: isMobile ? 50 : screenWidth * 0.05),
              padding: EdgeInsets.symmetric(
                  vertical: isMobile ? 2 : 4, horizontal: isMobile ? 8 : 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
                color: Colors.transparent,
              ),
              child: const Text(
                '2 hours',
              ),
            ),
            Container(
              margin: isMobile
                  ? EdgeInsets.only(right: 20, left: 35)
                  : EdgeInsets.only(right: 0),
              child: Row(
                children: const [
                  Icon(
                    Icons.star,
                    color: Color.fromRGBO(254, 221, 105, 1),
                  ),
                  Icon(
                    Icons.star,
                    color: Color.fromRGBO(254, 221, 105, 1),
                  ),
                  Icon(
                    Icons.star,
                    color: Color.fromRGBO(254, 221, 105, 1),
                  ),
                  Icon(
                    Icons.star,
                    color: Color.fromRGBO(217, 217, 217, 1),
                  ),
                  Icon(
                    Icons.star,
                    color: Color.fromRGBO(217, 217, 217, 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
