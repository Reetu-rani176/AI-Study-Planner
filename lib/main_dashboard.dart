import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/schedule_page.dart';
import 'pages/progress_page.dart';
import 'pages/ai_robot_page.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SchedulePage(),
    const ProgressPage(),
    const AIRobotPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 85,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 25,
              offset: const Offset(0, -8),
              spreadRadius: 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xFF8B5CF6),
            unselectedItemColor: const Color(0xFF9CA3AF),
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.2,
            ),
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: _buildNavIcon(
                  selectedIcon: Icons.home_rounded,
                  unselectedIcon: Icons.home_outlined,
                  isSelected: _currentIndex == 0,
                  color: const Color(0xFF8B5CF6),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: _buildNavIcon(
                  selectedIcon: Icons.calendar_month_rounded,
                  unselectedIcon: Icons.calendar_month_outlined,
                  isSelected: _currentIndex == 1,
                  color: const Color(0xFF10B981),
                ),
                label: 'Schedule',
              ),
              BottomNavigationBarItem(
                icon: _buildNavIcon(
                  selectedIcon: Icons.trending_up_rounded,
                  unselectedIcon: Icons.trending_up_outlined,
                  isSelected: _currentIndex == 2,
                  color: const Color(0xFFF59E0B),
                ),
                label: 'Progress',
              ),
              BottomNavigationBarItem(
                icon: _buildNavIcon(
                  selectedIcon: Icons.psychology_rounded,
                  unselectedIcon: Icons.psychology_outlined,
                  isSelected: _currentIndex == 3,
                  color: const Color(0xFFEF4444),
                ),
                label: 'AI Robot',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavIcon({
    required IconData selectedIcon,
    required IconData unselectedIcon,
    required bool isSelected,
    required Color color,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? color.withOpacity(0.15) : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: isSelected 
            ? Border.all(color: color.withOpacity(0.3), width: 1)
            : null,
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: color.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Icon(
          isSelected ? selectedIcon : unselectedIcon,
          key: ValueKey(isSelected),
          size: isSelected ? 28 : 24,
          color: isSelected ? color : const Color(0xFF9CA3AF),
        ),
      ),
    );
  }
}
