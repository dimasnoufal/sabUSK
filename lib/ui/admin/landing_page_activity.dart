import 'package:absen_qrcode/ui/admin/routes/app_router.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MaterialApp.router(
      routerConfig: appRouter.config(),
    );
  }
}
