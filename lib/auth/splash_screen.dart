import 'package:flutter/material.dart';
import 'package:projectq/core/theme/app_colors.dart';
import 'package:projectq/core/theme/app_text_styles.dart';
import 'package:projectq/core/theme/app_spacing.dart';
import 'package:projectq/auth/login_screen.dart';
import 'package:projectq/screen/home.dart';
import 'package:projectq/cache/cache_helper.dart';
import 'package:projectq/core/api/end_ponits.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.elasticOut),
      ),
    );

    _controller.forward();

    // Navigate after animation
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        final token = CacheHelper().getData(key: ApiKey.token);
        if (token != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>
                  Home(role: CacheHelper().getData(key: ApiKey.role) ?? ''),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 22, 235, 32),
              Color.fromARGB(255, 7, 240, 7),
            ],
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // House Icon Container
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        AppSpacing.radiusLarge,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Center(child: _buildHouseIcon()),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  // App Name
                  Text(
                    'StayNest',
                    style: AppTextStyles.heading1.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  // Tagline
                  Text(
                    'Find your perfect stay',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHouseIcon() {
    return CustomPaint(size: const Size(80, 80), painter: HouseIconPainter());
  }
}

class HouseIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Roof (Reddish-orange)
    paint.color = const Color(0xFFFF7675);
    final roofPath = Path()
      ..moveTo(size.width * 0.5, size.height * 0.2)
      ..lineTo(size.width * 0.2, size.height * 0.4)
      ..lineTo(size.width * 0.8, size.height * 0.4)
      ..close();
    canvas.drawPath(roofPath, paint);

    // Walls (Light brown)
    paint.color = const Color(0xFFD4A574);
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.25,
        size.height * 0.4,
        size.width * 0.5,
        size.height * 0.5,
      ),
      paint,
    );

    // Door (Dark brown)
    paint.color = const Color(0xFF6C4A3A);
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.4,
        size.height * 0.6,
        size.width * 0.2,
        size.height * 0.3,
      ),
      paint,
    );

    // Window (Light blue)
    paint.color = const Color(0xFF74B9FF);
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.35,
        size.height * 0.45,
        size.width * 0.15,
        size.height * 0.15,
      ),
      paint,
    );

    // Grass (Green strip)
    paint.color = const Color(0xFF00B894);
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.9, size.width, size.height * 0.1),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
