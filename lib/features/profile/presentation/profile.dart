import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tyg_vendor/constants/app_colors.dart';
import 'package:tyg_vendor/constants/app_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 330,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/back.jpg'))),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    color: AppColors.blackColor.withOpacity(0.2),
                    child: Text(
                      'TKG ONE STOP',
                      style: AppStyles.poppinsText(
                          fontWeight: FontWeight.w700,
                          size: 36,
                          color: AppColors.whiteColor),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Spacer(),
                      Row(
                          children: List.generate(4, (int index) {
                        return Icon(
                          Icons.star,
                          color: Color(0xFFff9900),
                          size: 14,
                        );
                      })),
                      Text(
                        '4.2',
                        style: AppStyles.poppinsText(
                            fontWeight: FontWeight.w400,
                            size: 10,
                            color: AppColors.mainRed),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColors.blackColor.withOpacity(0.2))),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.timer,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Working hours',
                          style: AppStyles.poppinsText(
                              fontWeight: FontWeight.w500,
                              size: 14,
                              color: AppColors.mainRed),
                        ),
                        Spacer(),
                        Text(
                          '9am- 11pm daily',
                          style: AppStyles.poppinsText(
                              fontWeight: FontWeight.w900,
                              size: 14,
                              color: AppColors.mainRed),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ProfileActionTile(
                    name: 'Restaurant settings',
                    leadingIcon: Icon(Icons.settings),
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {},
                  ),
                  ProfileActionTile(
                    leadingIcon: Icon(Icons.history),
                    name: 'My order History ',
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {},
                  ),
                  ProfileActionTile(
                    name: 'Notifications',
                    leadingIcon: Icon(Icons.notifications),
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {},
                  ),
                  ProfileActionTile(
                    name: 'Logout',
                    leadingIcon: Icon(Icons.logout),
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {},
                  ),
                  ProfileActionTile(
                    name: 'Support',
                    leadingIcon: Icon(Icons.support),
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileActionTile extends StatelessWidget {
  final String name;
  final Widget icon;
  final Widget leadingIcon;
  final VoidCallback onPressed;
  const ProfileActionTile({
    super.key,
    required this.name,
    required this.icon,
    required this.onPressed,
    required this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingIcon,
      title: Text(
        name,
        style: AppStyles.poppinsText(
            fontWeight: FontWeight.w400, size: 14, color: AppColors.blackColor),
      ),
      trailing: icon,
      onTap: onPressed,
    );
  }
}
