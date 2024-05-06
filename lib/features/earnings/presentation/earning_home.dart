import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyg_vendor/constants/app_colors.dart';
import 'package:tyg_vendor/constants/app_style.dart';
import 'package:tyg_vendor/features/authentication/presentation/login.dart';
import 'package:tyg_vendor/features/menue/presentation/create_menu.dart';

class EarningScreen extends StatelessWidget {
  EarningScreen({super.key});
  final List<double> incomeData = [2500, 3500, 4200, 3000, 3800, 4500, 4000];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CreateMenuScreen());
        },
        backgroundColor: AppColors.mainRed,
        child: Icon(
          Icons.menu_open,
          color: AppColors.whiteColor,
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Income',
          style: AppStyles.poppinsText(
              fontWeight: FontWeight.w900,
              size: 16,
              color: AppColors.blackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: CustomInputWidget(
                      hintText: 'Search',
                      obscureText: false,
                    ),
                  ),
                  Icon(
                    Icons.filter_alt,
                    color: AppColors.mainRed,
                    size: 40,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      AppColors.mainRed,
                      AppColors.mainRed.withOpacity(0.3),
                    ],
                  ),
                  color: AppColors.mainRed,
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Earnings',
                      style: AppStyles.poppinsText(
                          fontWeight: FontWeight.w400,
                          size: 14,
                          color: AppColors.whiteColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '\$44,000.00',
                      style: AppStyles.poppinsText(
                          fontWeight: FontWeight.w800,
                          size: 30,
                          color: AppColors.whiteColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Last Earnings ',
                          style: AppStyles.poppinsText(
                              fontWeight: FontWeight.w400,
                              size: 10,
                              color: AppColors.whiteColor),
                        ),
                        Text(
                          '\$44.00 ',
                          style: AppStyles.poppinsText(
                              fontWeight: FontWeight.w700,
                              size: 12,
                              color: AppColors.whiteColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.blackColor.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: const Offset(3, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All orders',
                      style: AppStyles.poppinsText(
                          fontWeight: FontWeight.w500,
                          size: 15,
                          color: AppColors.blackColor),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: incomeData.reduce((value, element) =>
                              value > element ? value : element) +
                          100, // Adjust the maximum Y value as per your data
                      titlesData: FlTitlesData(
                        leftTitles: SideTitles(showTitles: true, margin: 8),
                        bottomTitles: SideTitles(
                          showTitles: true,
                          margin: 18,
                          getTitles: (double value) {
                            // Customizing bottom titles (replace with your data)
                            switch (value.toInt()) {
                              case 0:
                                return 'Jan';
                              case 1:
                                return 'Feb';
                              case 2:
                                return 'Mar';
                              case 3:
                                return 'Apr';
                              case 4:
                                return 'May';
                              case 5:
                                return 'Jun';
                              case 6:
                                return 'Jul';
                              default:
                                return '';
                            }
                          },
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      barGroups: incomeData
                          .asMap()
                          .map((index, income) => MapEntry(
                                index,
                                BarChartGroupData(
                                  x: index,
                                  barRods: [
                                    BarChartRodData(
                                      y: income,
                                      colors: [AppColors.mainRed],
                                      width: 16,
                                    ),
                                  ],
                                ),
                              ))
                          .values
                          .toList(),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
