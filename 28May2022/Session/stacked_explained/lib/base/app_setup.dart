import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_explained/services/auth_service.dart';
import 'package:stacked_explained/views/home/home_view.dart';
import 'package:stacked_explained/views/login/login_view.dart';
import 'package:stacked_explained/views/splash/splash_view.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: HomeView),
], dependencies: [
  LazySingleton(classType: AuthService),
  Singleton(classType: NavigationService),
])
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
