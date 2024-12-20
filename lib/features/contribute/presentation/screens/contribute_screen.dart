import 'package:digital_defender/features/common/presentation/widgets/page_title.dart';
import 'package:digital_defender/features/common/presentation/widgets/social_media_switch.dart';
import 'package:digital_defender/features/contribute/presentation/widgets/submit_widget.dart';
import 'package:flutter/material.dart';

class ContributeScreen extends StatefulWidget {
  const ContributeScreen({super.key});

  @override
  State<ContributeScreen> createState() => _ContributeScreenState();
}

class _ContributeScreenState extends State<ContributeScreen> {
  final ValueNotifier<int> _selectedSocial = ValueNotifier(0);
  final TextEditingController _submitController = TextEditingController();
  final TextEditingController _reportController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const PageTitle(
            title:
                "Help contribute in defending palestine, share positive content or report fake content",
            icon: Icons.add,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SocialMediaSwitch(
              selectedButtonNotifier: _selectedSocial,
              onChange: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SubmitWidget(
              title: "Submit",
              controller: _submitController,
              desc:
                  "Submit inspiring and positive content about Palestine for our review and potential sharing.",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SubmitWidget(
              title: "Report",
              controller: _reportController,
              desc:
                  "Report any negative or misleading content about Palestine for our evaluation and action.",
            ),
          ),
        ],
      ),
    );
  }
}
