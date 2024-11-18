import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileFeedbacks extends StatelessWidget {
  ProfileFeedbacks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final isMobile = maxWidth < 600;

    return Container(
      height: 420,
      // width: 400,
      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Feedback',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w800,
              fontSize: 24,
              color: const Color.fromRGBO(0, 0, 0, 1),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView(
              children: feedbacks.map((feedback) {
                return _buildFeedbackRow(
                    name: feedback['name'] as String,
                    comment: feedback['comment'] as String,
                    rating: feedback['rating'] as int,
                    likes: feedback['likes'] as int,
                    isMobile: isMobile,
                    context: context);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeedbackRow(
      {required String name,
      required String comment,
      required int rating,
      required int likes,
      required bool isMobile,
      required BuildContext context}) {
    return Container(
      width: double.infinity,
      padding: isMobile
          ? const EdgeInsets.fromLTRB(15, 10, 0, 10)
          : const EdgeInsets.fromLTRB(15, 10, 10, 10),
      margin: isMobile
          ? const EdgeInsets.only(bottom: 15, right: 10)
          : const EdgeInsets.only(bottom: 15, right: 20),
      decoration: BoxDecoration(
        color: const Color(0xffF2F6FE),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/logo.png'),
            radius: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Column(
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
                Text(
                  comment,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff67727E),
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(rating, (_) {
                    return const Icon(
                      Icons.star_rate_rounded,
                      color: Color(0xffFEDD69),
                      size: 20,
                    );
                  }),
                ),
                if (isMobile)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_border),
                              ),
                              Text('$likes'),
                            ],
                          ),
                          if (!isMobile &&
                              (MediaQuery.of(context).size.width < 1000 ||
                                  MediaQuery.of(context).size.width > 1499))
                            Expanded(
                              child: Column(
                                children: [
                                  TextButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.reply_sharp,
                                      color: Colors.black,
                                    ),
                                    label: const Text(
                                      'Reply',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      Row(
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.reply_sharp,
                              color: Colors.black,
                            ),
                            label: const Text(
                              'Reply',
                              style: TextStyle(
                                fontSize: 18, // Change the font size to 18
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
              ],
            ),
          ),
          if (!isMobile) const SizedBox(width: 10),
          if (!isMobile &&
              (MediaQuery.of(context).size.width < 1000 ||
                  MediaQuery.of(context).size.width > 1499))
            Expanded(
              child: Column(
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.reply_sharp,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Reply',
                      style: TextStyle(
                        fontSize: 18, // Change the font size to 18
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          if (!isMobile &&
              (MediaQuery.of(context).size.width < 1000 ||
                  MediaQuery.of(context).size.width > 1499))
            const SizedBox(height: 20),
          if (!isMobile &&
              (MediaQuery.of(context).size.width < 1000 ||
                  MediaQuery.of(context).size.width > 1499))
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                ),
                Text('$likes'),
              ],
            ),
          if (!isMobile &&
              MediaQuery.of(context).size.width >= 1000 &&
              MediaQuery.of(context).size.width <= 1499)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  ),
                  Text('$likes'),
                  IconButton(
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                    icon: const Icon(
                      Icons.reply_sharp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }

  List<Map<String, dynamic>> feedbacks = [
    {
      'name': 'Amyrobson',
      'comment':
          'I find the service satisfactory. But there is still an effort to be made',
      'rating': 4,
      'likes': 5
    },
    {
      'name': 'John Doe',
      'comment': 'Great experience! Highly recommended.',
      'rating': 5,
      'likes': 25
    },
    {
      'name': 'Jane Smith',
      'comment': 'The service needs improvement. Not satisfied.',
      'rating': 2,
      'likes': 75
    },
  ];
}
