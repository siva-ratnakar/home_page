part of '../home.dart';

enum SocialIcons {
  facebook(
    link: Constants.facebookLink,
    imagePath: Constants.facebookImagePath,
    blackImagePath: Constants.facebookBlackImagePath,
  ),
  github(
    link: Constants.githubLink,
    imagePath: Constants.githubImagePath,
    blackImagePath: Constants.githubBlackImagePath,
  ),
  instagram(
    link: Constants.instagramLink,
    imagePath: Constants.instagramImagePath,
    blackImagePath: Constants.instagramBlackImagePath,
  ),
  linkedIn(
    link: Constants.linkedInLink,
    imagePath: Constants.linkedInImagePath,
    blackImagePath: Constants.linkedInBlackImagePath,
  ),
  scholar(
    link: Constants.scholarLink,
    imagePath: Constants.scholarImagePath,
    blackImagePath: Constants.scholarBlackImagePath,
  ),
  x(
    link: Constants.xLink,
    imagePath: Constants.xImagePath,
    blackImagePath: Constants.xBlackImagePath,
  );

  const SocialIcons({
    required this.link,
    required this.imagePath,
    required this.blackImagePath,
  });
  final String link;
  final String imagePath;
  final String blackImagePath;
}
