import 'package:foode/features/home/presentation/notification/notification_page.dart';

import 'router_libs.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  routes: [
    GoRoute(
      path: SplashPage.url,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: GetStartedPage.url,
      pageBuilder: (context, state) => const CupertinoPage(
        child: GetStartedPage(),
      ),
    ),
    GoRoute(
      path: SignInPage.url,
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: SignUpPage.url,
      builder: (context, state) => const SignUpPage(),
      routes: [
        GoRoute(
          path: "/bio",
          pageBuilder: (context, state) => const CupertinoPage(
            child: FillBioPage(),
          ),
          routes: [
            GoRoute(
              path: "/payment-method",
              pageBuilder: (context, state) => const CupertinoPage(
                child: PaymentMethodPage(),
              ),
              routes: [
                GoRoute(
                  path: "/upload-photo",
                  pageBuilder: (context, state) => const CupertinoPage(
                    child: UploadPhotoPage(),
                  ),
                  routes: [
                    GoRoute(
                      path: "/set-location",
                      pageBuilder: (context, state) => const CupertinoPage(
                        child: SetLocationPage(),
                      ),
                      routes: [
                        GoRoute(
                          path: "/congrats",
                          pageBuilder: (context, state) => const CupertinoPage(
                            child: CongratsPage(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    ShellRoute(
      builder: (context, state, child) {
        return MainPage(
          key: state.pageKey,
          currentIndex: switch (state.uri.path) {
            final p when p.startsWith("/home") => 0,
            final p when p.startsWith("/order") => 1,
            final p when p.startsWith("/contacts") => 2,
            final p when p.startsWith("/profile") => 3,
            _ => 0,
          },
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: "/home",
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: "/restaurants",
              builder: (context, state) => const AllRestaurantsPage(),
            ),
            GoRoute(
              path: "/menus",
              builder: (context, state) => const AllMenusPage(),
            ),
            GoRoute(
              path: "/notifications",
              builder: (context, state) => const NotificationPage(),
            ),
          ],
        ),
        GoRoute(
          path: "/order",
          builder: (context, state) => const OrderPage(),
        ),
        GoRoute(
          path: "/contacts",
          builder: (context, state) => const ContactsPage(),
        ),
        GoRoute(
          path: "/profile",
          builder: (context, state) => const ProfilePage(),
        ),
      ],
    )
  ],
);
