part of '../home.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.1,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const WholeDivider(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.08,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FooterIcon(socialIcons: SocialIcons.instagram),
                  FooterIcon(socialIcons: SocialIcons.facebook),
                  FooterIcon(socialIcons: SocialIcons.github),
                  FooterIcon(socialIcons: SocialIcons.linkedIn),
                  FooterIcon(socialIcons: SocialIcons.scholar),
                  FooterIcon(socialIcons: SocialIcons.x),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
