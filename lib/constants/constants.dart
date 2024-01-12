import 'package:siva_website/professional/src/classes.dart';

class Constants {
  // Owner related constants
  // static const String siteTitle = 'The Curious Explorer';
  static const String siteTitleFirst = 'The Curiou';
  static const String siteTitleAnimate = 's';
  static const String siteTitleLast = ' Explorer';
  static const String siteTitleAnmateImagePath = 'images/logo.png';
  // static const String siteOwnerName = 'Siva Ratnakar Immadi';
  static const String siteOwnerCircleName = 'Siva\nRatnakar\nImmadi';
  static const String ownerImagePath = 'images/siva.jpg';
  static const double siteTitleLetterSpacing = 10;

  // Title related constants
  static const String siteTitleFontFamily = 'IrishGrover';
  static const double titleBottomBorderWidth = 1.0;

  // Home components related constants
  static const String siteNameFontFamily = 'Papyrus';
  static const double homeCircleBorderWidth = 3.0;
  static const Duration defaultDuration = Duration(milliseconds: 300);

  // Professional page related constants
  static const String siteProfessionalTitleFontFamily = 'RubikDoodleShadow';
  static const String resumePathName = 'cv.pdf';
  static const Duration carouselIntervalDuration = Duration(seconds: 5);
  // ! This should have at least one item
  static const List<ProfessionalItem> professionalItems = [
    // TODO(immadisairaj): add items also for carousel
    ProfessionalItem(
      title: 'Education',
      iconImagePath: professionalEducationImagePath,
      itemsList: [
        CarouselItem(
          title: 'Ph.D.',
          description: 'Friedrich Miescher Institute',
          time: '2023 - Present',
        ),
        CarouselItem(
          title: 'Masters',
          description: 'Sri Sathya Sai Institute of Higher Learning',
          time: '2020 - 2022',
        ),
      ],
    ),
    ProfessionalItem(
      title: 'Experience',
      iconImagePath: professionalExperienceImagePath,
    ),
    ProfessionalItem(
      title: 'Publications',
      iconImagePath: professionalPublicationsImagePath,
      itemsList: [],
    ),
    ProfessionalItem(
      title: 'Awards',
      iconImagePath: professionalAwardsImagePath,
      itemsList: [
        CarouselItem(
          title: 'CSIR-NET Junior Research Fellowship',
          time: '2022',
        ),
        CarouselItem(
          title: 'Gold Medal',
          time: '2022',
        ),
      ],
    ),
  ];

  // Home Life component related constants
  static const lifeFrontImagePath = 'images/life_front.png';
  static const lifeBackImagePath = 'images/life_back.png';
  static const lifeMoveImagePath = 'images/life_move.png';
  static const lifeNonMoveImagePath = 'images/life_top.png';
  static const lifeMobileImagePath = 'images/life_mobile.png';
  static const lifeUrl = 'https://blog.sivaratnakar.com/life';

  // Home Bio Blogs component related constants
  static const bioBlogFrontImagePath = 'images/bioblog_front.png';
  static const bioBlogBackImagePath = 'images/bioblog_back.png';
  static const bioBlogMoveImagePath = 'images/bioblog_move.png';
  static const bioBlogMoveTopImagePath = 'images/bioblog_top.png';
  static const bioBlogMobileImagePath = 'images/bioblog_mobile.png';
  static const bioBlogUrl = 'https://blog.sivaratnakar.com/blog';

  // Home Contact component related constants
  static const contactFrontImagePath = 'images/contact_front.png';
  static const contactBackImagePath = 'images/contact_back.png';
  static const contactMoveImagePath = 'images/contact_move.png';
  static const contactMobileImagePath = 'images/contact_mobile.png';
  static const contactUrl = 'https://sivaratnakar.com/contact.html';

  // Home Professional component related constants
  static const professionalFrontImagePath = 'images/professional_front.png';
  static const professionalBackImagePath = 'images/professional_back.png';
  static const professionalMoveImagePath = 'images/professional_move.png';
  static const professionalMobileImagePath = 'images/professional_mobile.png';

  // Professional page images related constants
  static const professionalAwardsImagePath =
      'images/professional/awards_logo.png';
  static const professionalEducationImagePath =
      'images/professional/education_symbol.png';
  static const professionalExperienceImagePath =
      'images/professional/experience_logo.png';
  static const professionalPublicationsImagePath =
      'images/professional/publications_icon.png';

  // Footer - Social Icons related constants
  static const facebookImagePath = 'images/social/facebook.png';
  static const facebookBlackImagePath = 'images/social/facebook_black.png';
  static const facebookLink = 'https://www.facebook.com/sivaratnakar.immadi/';
  static const githubImagePath = 'images/social/github.png';
  static const githubBlackImagePath = 'images/social/github_black.png';
  static const githubLink = 'https://github.com/siva-ratnakar/';
  static const instagramImagePath = 'images/social/instagram.png';
  static const instagramBlackImagePath = 'images/social/instagram_black.png';
  static const instagramLink = 'https://www.instagram.com/siva_ratnakar/';
  static const linkedInImagePath = 'images/social/linkedIn.png';
  static const linkedInBlackImagePath = 'images/social/linkedIn_black.png';
  static const linkedInLink = 'https://www.linkedin.com/in/siva-ratnakar/';
  static const scholarImagePath = 'images/social/scholar.png';
  static const scholarBlackImagePath = 'images/social/scholar_black.png';
  static const scholarLink =
      'https://scholar.google.com/citations?user=CTIJ3LQAAAAJ';
  static const xImagePath = 'images/social/x.png';
  static const xBlackImagePath = 'images/social/x_black.png';
  static const xLink = 'https://twitter.com/SivaRatnakar/';

  // cache images
  static const cacheHomeWebImagesPaths = [
    // logo
    siteTitleAnmateImagePath,
    // life
    lifeBackImagePath,
    lifeFrontImagePath,
    lifeMoveImagePath,
    lifeNonMoveImagePath,
    // bio blog
    bioBlogBackImagePath,
    bioBlogFrontImagePath,
    bioBlogMoveImagePath,
    bioBlogMoveTopImagePath,
    // contact
    contactBackImagePath,
    contactFrontImagePath,
    contactMoveImagePath,
    // professional
    professionalBackImagePath,
    professionalFrontImagePath,
    professionalMoveImagePath,
    // social links
    facebookBlackImagePath,
    facebookImagePath,
    githubBlackImagePath,
    githubImagePath,
    instagramBlackImagePath,
    instagramImagePath,
    linkedInBlackImagePath,
    linkedInImagePath,
    scholarBlackImagePath,
    scholarImagePath,
    xBlackImagePath,
    xImagePath,
  ];
  static const cacheHomeMobileImagesPaths = [
    // logo
    siteTitleAnmateImagePath,
    // life
    lifeMobileImagePath,
    // bio blog
    bioBlogMobileImagePath,
    // contact
    contactMobileImagePath,
    // professional
    professionalMobileImagePath,
    // social links
    facebookBlackImagePath,
    githubBlackImagePath,
    instagramBlackImagePath,
    linkedInBlackImagePath,
    scholarBlackImagePath,
    xBlackImagePath,
  ];
  static const cacheProfessionalImagePaths = [
    professionalAwardsImagePath,
    professionalEducationImagePath,
    professionalExperienceImagePath,
    professionalPublicationsImagePath,
  ];

  // ! - DON'T TOUCH
  static const double bigWidgetSize = 9000;
}
