import 'package:flutter/material.dart';
import '../models/learner_profile.dart';
import '../theme.dart';
import '../widgets/tactile_button.dart';

class LearningPathPage extends StatelessWidget {
  const LearningPathPage({
    super.key,
    required this.profile,
    required this.onStartLesson,
  });
  final LearnerProfile profile;
  final VoidCallback onStartLesson;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
      children: [
        _dailyQuestPill(),
        const SizedBox(height: 12),
        _unitBanner(),
        const SizedBox(height: 20),
        _pathMap(context),
        const SizedBox(height: 20),
        _unit2Teaser(),
      ],
    );
  }

  Widget _dailyQuestPill() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2))
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: secondaryFixed,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(child: Text('⚡', style: TextStyle(fontSize: 18))),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('DAILY QUEST',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: secondary,
                        letterSpacing: 0.5)),
                const Text('Score 90%+ in 1 lesson',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: surfaceContainerHigh,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              const Text('🐚', style: TextStyle(fontSize: 12)),
              const SizedBox(width: 3),
              Text('+20',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: tertiary)),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _unitBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 10,
              offset: const Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: onPrimary.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        const Icon(Icons.local_florist,
                            size: 14, color: primaryFixed),
                        const SizedBox(width: 4),
                        Text('Unit 1 • Foundation',
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: primaryFixed,
                                letterSpacing: 0.5)),
                      ]),
                    ),
                    const SizedBox(height: 6),
                    const Text('Greetings & Everyday Respect',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: onPrimary)),
                    Text('Ebimi nua & Doooo',
                        style: TextStyle(
                            fontSize: 13,
                            color: const Color(0xFFF7FFF2).withOpacity(0.9))),
                  ],
                ),
              ),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFF005320),
                        offset: Offset(0, 4),
                        blurRadius: 0)
                  ],
                ),
                child: const Icon(Icons.auto_stories, color: onPrimary, size: 22),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: onPrimary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Step ${profile.currentLesson} of 5 lessons',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: onPrimary)),
                          Text('${profile.currentLesson * 20}%',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: primaryFixed)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: LinearProgressIndicator(
                          value: profile.currentLesson / 5,
                          backgroundColor: onPrimary.withOpacity(0.2),
                          color: primaryFixed,
                          minHeight: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: onPrimary.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(mainAxisSize: MainAxisSize.min, children: [
                    Text('🌴', style: TextStyle(fontSize: 14)),
                    SizedBox(width: 4),
                    Text('Bayelsa',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: onPrimary)),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _pathMap(BuildContext context) {
    return SizedBox(
      height: 520,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomPaint(
            size: const Size(double.infinity, 520),
            painter: _PathPainter(),
          ),
          // Node 1 - completed
          Positioned(
            top: 0,
            left: 40,
            child: _completedNode('1. Morning Greetings', 'Ebimi nua • Mastered'),
          ),
          // Node 2 - completed
          Positioned(
            top: 120,
            right: 40,
            child: _completedNode('2. Respectful Inquiries', 'Dooo / Anua • Mastered'),
          ),
          // Node 3 - active
          Positioned(
            top: 250,
            left: 60,
            child: _activeNode(context),
          ),
          // Node 4 - locked (cowrie chest)
          Positioned(
            top: 380,
            right: 50,
            child: _lockedChestNode(),
          ),
          // Node 5 - locked
          Positioned(
            top: 450,
            left: 50,
            child: _lockedNode('5. Daily Words'),
          ),
        ],
      ),
    );
  }

  Widget _completedNode(String title, String sub) {
    return Column(
      children: [
        Row(mainAxisSize: MainAxisSize.min, children: const [
          Text('⭐', style: TextStyle(fontSize: 14)),
          Text('⭐', style: TextStyle(fontSize: 18)),
          Text('⭐', style: TextStyle(fontSize: 14)),
        ]),
        const SizedBox(height: 4),
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: primary,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                  color: Color(0xFF005320), offset: Offset(0, 8), blurRadius: 0)
            ],
          ),
          child: Center(
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                  color: primaryContainer, shape: BoxShape.circle),
              child: const Icon(Icons.check, color: onPrimary, size: 28),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: surfaceContainerLowest,
            borderRadius: BorderRadius.circular(999),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2))
            ],
          ),
          child: Column(children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w700)),
            Text(sub,
                style: TextStyle(fontSize: 11, color: primary)),
          ]),
        ),
      ],
    );
  }

  Widget _activeNode(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisSize: MainAxisSize.min, children: [
          Row(children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 6,
                      offset: const Offset(0, 2))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tọrọ nua!',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: primary)),
                  Text("Let's learn together! 🌿",
                      style: TextStyle(fontSize: 12, color: onSurfaceVariant)),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: secondaryFixed,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.flutter_dash, size: 32, color: secondary),
            ),
          ]),
        ]),
        const SizedBox(height: 8),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: primaryFixedDim.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: primary.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
            GestureDetector(
              onTap: onStartLesson,
              child: Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: primary,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFF005320),
                        offset: Offset(0, 10),
                        blurRadius: 0)
                  ],
                ),
                child: const Icon(Icons.play_arrow,
                    color: onPrimary, size: 40),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onStartLesson,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: secondaryContainer,
              borderRadius: BorderRadius.circular(999),
              boxShadow: const [
                BoxShadow(
                    color: secondary, offset: Offset(0, 4), blurRadius: 0)
              ],
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              const Text('START',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: onSecondaryFixed)),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: surfaceContainerLowest.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text('+15 XP',
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                        color: secondary)),
              ),
            ]),
          ),
        ),
        const SizedBox(height: 4),
        const Text('3. Family Welcomes',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
      ],
    );
  }

  Widget _lockedChestNode() {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: surfaceContainerHigh,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                  color: outlineVariant, offset: Offset(0, 6), blurRadius: 0)
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Text('🐚', style: TextStyle(fontSize: 28)),
              Positioned(
                top: 4,
                right: 4,
                child: Icon(Icons.lock, size: 14, color: outline),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: surfaceContainerLowest,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Text('Cowrie Chest',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: secondary)),
            Text(' • 50 🐚',
                style: TextStyle(fontSize: 11, color: onSurfaceVariant)),
          ]),
        ),
      ],
    );
  }

  Widget _lockedNode(String title) {
    return Opacity(
      opacity: 0.85,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: surfaceContainer,
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                    color: outlineVariant, offset: Offset(0, 6), blurRadius: 0)
              ],
            ),
            child: Center(
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    color: surfaceContainerHigh, shape: BoxShape.circle),
                child: Icon(Icons.lock, color: outline, size: 22),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: surfaceContainerHigh,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(title,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: onSurfaceVariant)),
          ),
        ],
      ),
    );
  }

  Widget _unit2Teaser() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: tertiaryFixed,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(child: Text('🛶', style: TextStyle(fontSize: 24))),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text('Next: Unit 2',
                      style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: tertiary,
                          letterSpacing: 0.5)),
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: surfaceContainer,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text('Locked',
                        style: TextStyle(fontSize: 11, color: outline)),
                  ),
                ]),
                const Text('The River, Fishing & Market Living',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700)),
                Text('Beni & Fiyai • Waterways culture',
                    style: TextStyle(fontSize: 12, color: onSurfaceVariant)),
              ],
            ),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
                color: surfaceContainer, shape: BoxShape.circle),
            child: Icon(Icons.lock, color: outline, size: 18),
          ),
        ],
      ),
    );
  }
}

class _PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFDAE2FD)
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(size.width * 0.5, 40)
      ..cubicTo(size.width * 0.3, 100, size.width * 0.25, 150,
          size.width * 0.3, 200)
      ..cubicTo(size.width * 0.35, 250, size.width * 0.7, 240,
          size.width * 0.7, 310)
      ..cubicTo(size.width * 0.7, 380, size.width * 0.3, 400,
          size.width * 0.35, 460);

    canvas.drawPath(path, paint);

    final dashPaint = Paint()
      ..color = primary.withOpacity(0.3)
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawPath(path, dashPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
