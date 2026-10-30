import 'package:flutter/material.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_strings.dart';
import '../../core/responsive/responsive.dart';
import '../../data/projects_data.dart';
import '../../widgets/cards/section_container.dart';
import '../../widgets/common/section_heading.dart';
import '../../widgets/common/animated_fade_in.dart';
import '../../widgets/project/project_card.dart';
import 'project_details_view.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final columns = Responsive.gridColumns(context, mobile: 1, tablet: 2, desktop: 3, wide: 3);

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            overline: 'Work',
            title: AppStrings.projectsTitle,
            subtitle: AppStrings.projectsSubtitle,
          ),
          const SizedBox(height: AppDimensions.spaceXxl),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ProjectsData.projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: AppDimensions.spaceLg,
              mainAxisSpacing: AppDimensions.spaceLg,
              childAspectRatio: 0.60,
            ),
            itemBuilder: (context, index) {
              final project = ProjectsData.projects[index];
              return AnimatedFadeIn(
                delay: Duration(milliseconds: 40 * index),
                child: ProjectCard(
                  project: project,
                  onTap: () => showProjectDetails(context, project),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
