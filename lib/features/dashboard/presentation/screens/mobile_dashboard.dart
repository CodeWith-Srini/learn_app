import 'package:flutter/material.dart';

// class MobileDashboard extends StatefulWidget {
//   const MobileDashboard({super.key});

//   @override
//   State<MobileDashboard> createState() => _MobileDashboardState();
// }

// class _MobileDashboardState extends State<MobileDashboard> {
//   @override
//   Widget build(BuildContext context) {
//     log('Rebuilding');
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         actionsPadding: EdgeInsets.all(7),
//         backgroundColor: Colors.white,

//         leading: Container(
//           margin: EdgeInsets.all(7),
//           child: PressableButton(
//             iconnew: Icons.move_down_rounded,
//             iconsize: 20,
//             padding: MediaQuery.sizeOf(context).width * 0.0,
//             width: MediaQuery.sizeOf(context).width * 0.1,
//           ),
//         ),
//         title: RichText(
//           text: TextSpan(
//             children: [
//               TextSpan(
//                 text: 'Srinivas',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//               TextSpan(
//                 text: '.dev',
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           PressableButton(
//             title: 'Resume',
//             iconnew: Icons.download_rounded,
//             padding: MediaQuery.sizeOf(context).width * 0.02,
//             width: MediaQuery.sizeOf(context).width * 0.3,
//           ),
//         ],
//       ),
//       body: Column(children: [

//         ],
//       ),
//     );
//   }
// }

class MobileDashboard extends StatefulWidget {
  const MobileDashboard({super.key});

  @override
  State<MobileDashboard> createState() => _MobileDashboardState();
}

class _MobileDashboardState extends State<MobileDashboard> {
  final ScrollController _scrollController = ScrollController();

  final List<String> _sections = [
    'Home',
    'About',
    'Skills',
    'Projects',
    'Contact',
  ];

  final List<GlobalKey> _sectionKeys = List.generate(5, (_) => GlobalKey());

  int _activeIndex = 0;
  double _scrollProgress = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  // Detect currently visible section and scroll progress
  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;

    final progress =
        position.maxScrollExtent == 0
            ? 0.0
            : (position.pixels / position.maxScrollExtent).clamp(0.0, 1.0);

    // Detect active section
    final anchor = MediaQuery.sizeOf(context).height * 0.30;

    int currentIndex = 0;

    for (int i = 0; i < _sectionKeys.length; i++) {
      final sectionContext = _sectionKeys[i].currentContext;

      if (sectionContext == null) continue;

      final box = sectionContext.findRenderObject() as RenderBox;
      final top = box.localToGlobal(Offset.zero).dy;

      if (top <= anchor) {
        currentIndex = i;
      } else {
        break;
      }
    }

    if (_activeIndex != currentIndex ||
        (_scrollProgress - progress).abs() > 0.005) {
      setState(() {
        _activeIndex = currentIndex;
        _scrollProgress = progress;
      });
    }
  }

  // Scroll to a particular section
  void _scrollToSection(int index) {
    final targetContext = _sectionKeys[index].currentContext;

    if (targetContext == null) return;

    Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
      alignment: 0,
    );
  }

  Widget _buildSection(int index, String title, Color color) {
    return Container(
      key: _sectionKeys[index],
      height: 600,
      width: double.infinity,
      color: color,
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(value: _scrollProgress, minHeight: 4),
        ),
      ),
      body: Column(
        children: [
          // Navigation buttons
          Wrap(
            spacing: 8,
            children: List.generate(_sections.length, (index) {
              return TextButton(
                onPressed: () => _scrollToSection(index),
                child: Text(
                  _sections[index],
                  style: TextStyle(
                    color: _activeIndex == index ? Colors.blue : Colors.grey,
                    fontWeight:
                        _activeIndex == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                  ),
                ),
              );
            }),
          ),

          // Scrollable portfolio
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  _buildSection(0, 'Home', Colors.white),
                  _buildSection(1, 'About', Colors.blue.shade100),
                  _buildSection(2, 'Skills', Colors.green.shade100),
                  _buildSection(3, 'Projects', Colors.orange.shade100),
                  _buildSection(4, 'Contact', Colors.purple.shade100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }
}
