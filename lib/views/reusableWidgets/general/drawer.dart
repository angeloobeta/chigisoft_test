import 'package:chigisoft_test/model/utilities/imports/generalImport.dart';

Widget drawer(context,
    {required Widget child, AdvancedDrawerController? controller}) {
  return AdvancedDrawer(
    backdropColor: black,
    controller: controller,
    animationCurve: Curves.bounceInOut,
    // Curves.easeInOut,
    animationDuration: const Duration(milliseconds: 300),
    animateChildDecoration: true,
    rtlOpening: false,
    // openScale: 1.0,
    disabledGestures: false,
    childDecoration: const BoxDecoration(
      // NOTICE: Uncomment if you want to add shadow behind the page.
      // Keep in mind that it may cause animation jerks.
      // boxShadow: <BoxShadow>[
      //   BoxShadow(
      //     color: Colors.black12,
      //     blurRadius: 0.0,
      //   ),
      // ],
      borderRadius: const BorderRadius.all(Radius.circular(16)),
    ),
    child: child!,
    drawer: SafeArea(
      child: S(
        h: 768,
        w: 375,
        child: Stack(
          children: [
            // menu
            rowPositioned(
                child: GeneralTextDisplay(
                    "Menu", white, 1, 19.08, FontWeight.w500, "500"),
                top: 128,
                left: 24),
            // account
            drawerItem(Icons.account_balance_wallet_rounded, "Home", 174, onTap: (){
              controller!.hideDrawer();
              Navigator.pushNamed(context, homeAgentPage);
            }),
            drawerItem(FontAwesomeIcons.userGear, "Business Page", 230,
                onTap: () {
              // close the drawer before living the page
              controller!.hideDrawer();
              Navigator.pushNamed(context, businessPage);
            }),
            // terms of use
            drawerItem(Icons.info, "Business Info Page", 290, onTap: (){
              controller!.hideDrawer();
              Navigator.pushNamed(context, businessInfoPage);
            }),

            // sign out
            drawerItem(Icons.logout_rounded, "Sign Out", 440,
                color: const Color.fromRGBO(255, 41, 41, 1), onTap: () async {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => Center(
                  child: S(
                    h: 200,
                    w: 200,
                    child: customDialog(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            loading(),
                            S(h: 20),
                             GeneralTextDisplay(
                              "Signing user out",
                              white,
                              3,
                              14,
                              FontWeight.w500,
                              "",
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        align: Alignment.center),
                  ),
                ),
              );
              await LocalStorage.setString("appStatus", "logoutStatus");
              // await localStorage.setString(token, ""); // this will remain in the
              // phone storage for biometric
              await LocalStorage.setString("savingIdString", "");
              //await localStorage.setString(baseUrlString, "");
              Navigator.pushNamedAndRemoveUntil(
                  context, login, (route) => false);
            }),
            // version
            rowPositioned(
                child: GeneralTextDisplay(
                  "Ver 1.0.0",
                  white.withOpacity(0.5),
                  1,
                  14,
                  FontWeight.w500,
                  "version",
                  letterSpacing: 0.8,
                ),
                top: 500,
                left: 24)
          ],
        ),
      ),
    ),
  );
}

Widget drawerItem(IconData icon, String name, double top,
    {Color? color, Function? onTap}) {
  return rowPositioned(
      child: GestureDetector(
        onTap: () {
          onTap!();
        },
        child: Row(
          children: [
            Center(
                child:
                    GeneralIconDisplay(icon, color ?? hexColor("186F93"), UniqueKey(), 16)),
            S(w: 14),
            GeneralTextDisplay(
              name,
              color ?? white,
              1,
              14,
              FontWeight.w500,
              "text",
              letterSpacing: 0.8,
            ),
          ],
        ),
      ),
      top: top,
      left: 24);
}
