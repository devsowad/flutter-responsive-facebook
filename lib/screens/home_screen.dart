import 'package:flutter/material.dart';
import 'components/home_screen_desktop.dart';
import 'components/home_screen_mobile.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Responsive(
        mobile: HomeScreenMobile(scrollController: _trackingScrollController),
        desktop: HomeScreenDesktop(scrollController: _trackingScrollController),
      ),
    );
  }
}
