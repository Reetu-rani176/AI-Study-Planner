import 'package:flutter/material.dart';

class AIRobotPage extends StatelessWidget {
  const AIRobotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.school,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'AI Study Planner',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Today's Recommendation Section
                      const Text(
                        "Today's Recommendation",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Recommendation Cards
                      _buildRecommendationCard(
                        icon: Icons.lightbulb_outline,
                        iconColor: const Color(0xFFF59E0B),
                        title: 'Focus on Mathematics',
                        description: 'Your performance shows room for improvement. Spend 2 hours on Calculus today.',
                        backgroundColor: const Color(0xFFFEF3C7),
                      ),
                      const SizedBox(height: 12),
                      
                      _buildRecommendationCard(
                        icon: Icons.access_time,
                        iconColor: const Color(0xFFEF4444),
                        title: 'Optimal Study Time',
                        description: 'Based on your patterns, you\'re most focused between 2-4 PM.',
                        backgroundColor: const Color(0xFFFEE2E2),
                      ),
                      const SizedBox(height: 12),
                      
                      _buildRecommendationCard(
                        icon: Icons.pause_circle_outline,
                        iconColor: const Color(0xFF8B5CF6),
                        title: 'Break Reminder',
                        description: 'Take a 15-minute break every hour for better retention.',
                        backgroundColor: const Color(0xFFF3E8FF),
                      ),
                      const SizedBox(height: 32),

                      // Today's Recommendation (Study Methods)
                      const Text(
                        "Today's Recommendation",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Study Methods Grid - Using LayoutBuilder for responsive design
                      LayoutBuilder(
                        builder: (context, constraints) {
                          double cardWidth = (constraints.maxWidth - 16) / 2;
                          double cardHeight = cardWidth * 0.85; // Better aspect ratio
                          
                          return Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children: [
                              SizedBox(
                                width: cardWidth,
                                height: cardHeight,
                                child: _buildStudyMethodCard(
                                  title: 'Pomodoro',
                                  subtitle: '25min focus',
                                  icon: Icons.timer,
                                  backgroundColor: const Color(0xFFDDD6FE),
                                  iconColor: const Color(0xFF8B5CF6),
                                ),
                              ),
                              SizedBox(
                                width: cardWidth,
                                height: cardHeight,
                                child: _buildStudyMethodCard(
                                  title: 'Active Recall',
                                  subtitle: 'Test yourself',
                                  icon: Icons.psychology,
                                  backgroundColor: const Color(0xFFFEF3C7),
                                  iconColor: const Color(0xFFF59E0B),
                                ),
                              ),
                              SizedBox(
                                width: cardWidth,
                                height: cardHeight,
                                child: _buildStudyMethodCard(
                                  title: 'Spaced Rep',
                                  subtitle: 'Review cycle',
                                  icon: Icons.repeat,
                                  backgroundColor: const Color(0xFFD1FAE5),
                                  iconColor: const Color(0xFF10B981),
                                ),
                              ),
                              SizedBox(
                                width: cardWidth,
                                height: cardHeight,
                                child: _buildStudyMethodCard(
                                  title: 'Mind Maps',
                                  subtitle: 'Visual learning',
                                  icon: Icons.account_tree,
                                  backgroundColor: const Color(0xFFE0F2FE),
                                  iconColor: const Color(0xFF0EA5E9),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 20), // Add bottom padding
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
    required Color backgroundColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                    height: 1.4,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudyMethodCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF6B7280),
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
