import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileInvoices extends StatelessWidget {
  final List<Map<String, String>> invoices;

  const ProfileInvoices({
    Key? key,
    this.invoices = const [],
  }) : super(key: key);



  void _showAllInvoicesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final maxWidth = MediaQuery.of(context).size.width;
        final isMobile = maxWidth < 600;

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: isMobile ? MediaQuery.of(context).size.width * 0.8 : 1100,
            height: isMobile ? 500 : 650,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              border: Border.all(color: Colors.black),
            ),
            child: Column(

              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  margin: isMobile
                      ? const EdgeInsets.only(right: 15)
                      : const EdgeInsets.only(right: 35, top:15),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close_rounded,
                      size: isMobile ? 40 : 60,
                    ),
                  ),
                ),
                Text(
                  'All Invoices',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: isMobile ? 20 : 24,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: ListView.builder(
                    itemCount: invoices.length,
                    itemBuilder: (context, index) {
                      final invoice = invoices[index];
                      return buildInvoiceItem(invoice, context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildInvoiceItem(Map<String, String> invoice, BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final isMobile = maxWidth < 600;

    return Container(
      padding: isMobile
          ? const EdgeInsets.only(right: 10)
          : const EdgeInsets.only(right: 20, left: 20),
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                invoice['date'] ?? '',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 18 : 20,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
              const SizedBox(height: 7),
              Text(
                invoice['number'] ?? '',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: isMobile ? 14 : 16,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
            ],
          ),
          const Expanded(
            child: SizedBox(width: 1),
          ),
          Text(
            invoice['amount'] ?? '',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: isMobile ? 14 : 16,
              color: const Color.fromRGBO(0, 0, 0, 1),
            ),
          ),
          const SizedBox(width: 5),
          TextButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/svg/pdf.svg',
              width: 15,
            ),
            label: Text(
              'PDF',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: isMobile ? 14 : 16,
                color: const Color.fromRGBO(0, 0, 0, 1),
              ),
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

    return Expanded(
      child: Container(
        height: 200,
        padding: isMobile
            ? const EdgeInsets.only(left: 10, top: 10, right: 0, bottom: 10)
            : const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Invoices',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: isMobile ? 20 : 24,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
                const Expanded(
                  child: SizedBox(width: 1),
                ),
                Container(
                  margin: isMobile
                      ? const EdgeInsets.only(right: 10)
                      : const EdgeInsets.only(right: 0),
                  child: OutlinedButton(
                    onPressed: () => _showAllInvoicesDialog(context),
                    child: Text(
                      'View all',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: isMobile ? 14 : 16,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: isMobile
                          ? const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10)
                          : const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      side: const BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: invoices.length,
                itemBuilder: (context, index) {
                  final invoice = invoices[index];
                  return buildInvoiceItem(invoice, context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
