import 'package:cv/app.dart';
import 'package:cv/page_title.dart';
import 'package:cv/widget/animated_text.dart';
import 'package:cv/widget/react_button.dart';
import 'package:flutter/material.dart';

import 'base_page.dart';

final companies = [
  Company(
    imagePath: "image/samsung.png",
    name: "SAMSUNG",
    time: "1 year 2 months",
  ),
  Company(
    imagePath: "image/vti.png",
    name: "VTI",
    time: "1 year",
  ),
  Company(
    imagePath: "image/tiki.png",
    name: "Tiki",
    time: "4 months",
  ),
  Company(
    imagePath: "image/vingroup.png",
    name: "Vingroup",
    time: "Current company",
  ),
];

class CompanyPage extends StatefulWidget {
  CompanyPage(GlobalKey key) : super(key: key);

  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  Widget _buildCompany(Company company) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              height: 164,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 5 / 4,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Text(
                            company.time,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      ReactButton(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.grey.withAlpha(24),
                          child: Image.asset(
                            company.imagePath,
                            fit: BoxFit.fitHeight,
                            height: 64,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            AnimatedText(
              text: company.name,
              onTap: () {},
            )
          ],
        ),
        SizedBox(width: 12)
      ],
    );
  }

  Widget _buildCompanies() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: HORIZONTAL_PAGE_PADDING),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: companies.reversed.map((e) => _buildCompany(e)).toList(),
      ),
    );
  }

  Widget build(BuildContext context) {
    return BasePage(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: VERTICAL_PAGE_PADDING,
              right: VERTICAL_PAGE_PADDING,
              top: VERTICAL_PAGE_PADDING,
            ),
            child: PageTitle("Companies"),
          ),
          SizedBox(height: 64),
          _buildCompanies(),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

class Company {
  String imagePath;
  String name;
  String time;

  Company({
    required this.imagePath,
    required this.name,
    required this.time,
  });
}
