import 'package:digital_defender/core/utils/constants/constant_functions.dart';
import 'package:digital_defender/di/di_container.dart';
import 'package:digital_defender/features/common/presentation/widgets/page_title.dart';
import 'package:digital_defender/features/common/presentation/widgets/social_media_switch.dart';
import 'package:digital_defender/features/contribute/data/models/send_content_params.dart';
import 'package:digital_defender/features/contribute/presentation/bloc/contribute_bloc.dart';
import 'package:digital_defender/features/contribute/presentation/widgets/submit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContributeScreen extends StatefulWidget {
  const ContributeScreen({super.key});

  @override
  State<ContributeScreen> createState() => _ContributeScreenState();
}

class _ContributeScreenState extends State<ContributeScreen> {
  final ValueNotifier<int> _selectedSocial = ValueNotifier(0);
  final TextEditingController _submitController = TextEditingController();
  final TextEditingController _reportController = TextEditingController();
  final ContributeBloc _contributeBloc = getIt<ContributeBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _contributeBloc,
      child: BlocListener<ContributeBloc, ContributeState>(
        listener: (context, state) {
          if (state.sendContentResponse.success) {
            showTopSnackbar(
              title: "Success",
              message: "Your link is now pending approval from the admin",
            );
            _submitController.clear();
          }
        },
        child: _buildContainer(),
      ),
    );
  }

  Container _buildContainer() {
    return Container(
      color: Colors.white,
      child: BlocBuilder<ContributeBloc, ContributeState>(
        builder: (context, state) {
          return Column(
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
                  title: AppLocalizations.of(context)!.submit,
                  controller: _submitController,
                  desc: AppLocalizations.of(context)!.submitInspiringContent,
                  onTap: () {
                    _contributeBloc.add(
                      SubmitContent(
                        SendContentParams(
                          link: _submitController.text.trim(),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SubmitWidget(
                  title: "Report",
                  controller: _reportController,
                  desc: AppLocalizations.of(context)!.reportAnyNegative,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
