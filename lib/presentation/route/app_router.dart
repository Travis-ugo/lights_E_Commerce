import 'package:auto_route/auto_route.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/route/app_router.gr.dart';
           
              
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')      
class AppRouter extends $AppRouter {      
   
 @override      
 List<AutoRoute> get routes => [      
   //HomeScreen is generated as HomeRoute because     
   //of the replaceInRouteName property   
   AutoRoute(page:NewManProject.page, initial: true), 
  ];
}  