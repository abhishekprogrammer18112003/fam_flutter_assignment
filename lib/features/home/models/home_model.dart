// Root Model
class FamxPayPage {
  final int id;
  final String slug;
  final String? title;
  final String? formattedTitle;
  final String? description;
  final String? formattedDescription;
  final List<HcGroup> hcGroups;

  FamxPayPage({
    required this.id,
    required this.slug,
    this.title,
    this.formattedTitle,
    this.description,
    this.formattedDescription,
    required this.hcGroups,
  });

  factory FamxPayPage.fromJson(Map<String, dynamic> json) {
    return FamxPayPage(
      id: json['id'],
      slug: json['slug'],
      title: json['title'],
      formattedTitle: json['formatted_title'],
      description: json['description'],
      formattedDescription: json['formatted_description'],
      hcGroups: (json['hc_groups'] as List)
          .map((e) => HcGroup.fromJson(e))
          .toList(),
    );
  }
}

// HcGroup Model
class HcGroup {
  final int id;
  final String name;
  final String designType;
  final int cardType;
  final List<CardModel> cards;
  final bool isScrollable;
  final int height;
  final bool isFullWidth;
  final String slug;
  final int level;

  HcGroup({
    required this.id,
    required this.name,
    required this.designType,
    required this.cardType,
    required this.cards,
    required this.isScrollable,
    required this.height,
    required this.isFullWidth,
    required this.slug,
    required this.level,
  });

  factory HcGroup.fromJson(Map<String, dynamic> json) {
    return HcGroup(
      id: json['id'],
      name: json['name'],
      designType: json['design_type'],
      cardType: json['card_type'],
      cards: (json['cards'] as List)
          .map((e) => CardModel.fromJson(e))
          .toList(),
      isScrollable: json['is_scrollable'],
      height: json['height'],
      isFullWidth: json['is_full_width'],
      slug: json['slug'],
      level: json['level'],
    );
  }
}

// Card Model
class CardModel {
  final int id;
  final String name;
  final String slug;
  final String? title;
  final FormattedTitle? formattedTitle;
  final List<dynamic> positionalImages;
  final List<dynamic> components;
  final String? url;
  final BgImage? bgImage;
  final List<Cta>? cta;
  final bool isDisabled;
  final bool isShareable;
  final bool isInternal;

  CardModel({
    required this.id,
    required this.name,
    required this.slug,
    this.title,
    this.formattedTitle,
    required this.positionalImages,
    required this.components,
    this.url,
    this.bgImage,
    this.cta,
    required this.isDisabled,
    required this.isShareable,
    required this.isInternal,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      title: json['title'],
      formattedTitle: json['formatted_title'] != null
          ? FormattedTitle.fromJson(json['formatted_title'])
          : null,
      positionalImages: json['positional_images'] ?? [],
      components: json['components'] ?? [],
      url: json['url'],
      bgImage: json['bg_image'] != null
          ? BgImage.fromJson(json['bg_image'])
          : null,
      cta: (json['cta'] as List?)?.map((e) => Cta.fromJson(e)).toList(),
      isDisabled: json['is_disabled'],
      isShareable: json['is_shareable'],
      isInternal: json['is_internal'],
    );
  }
}

// FormattedTitle Model
class FormattedTitle {
  final String text;
  final String align;
  final List<Entity> entities;

  FormattedTitle({
    required this.text,
    required this.align,
    required this.entities,
  });

  factory FormattedTitle.fromJson(Map<String, dynamic> json) {
    return FormattedTitle(
      text: json['text'],
      align: json['align'],
      entities: (json['entities'] as List)
          .map((e) => Entity.fromJson(e))
          .toList(),
    );
  }
}

// Entity Model
class Entity {
  final String text;
  final String type;
  final String? color;
  final int? fontSize;
  final String? fontStyle;
  final String? fontFamily;

  Entity({
    required this.text,
    required this.type,
    this.color,
    this.fontSize,
    this.fontStyle,
    this.fontFamily,
  });

  factory Entity.fromJson(Map<String, dynamic> json) {
    return Entity(
      text: json['text'],
      type: json['type'],
      color: json['color'],
      fontSize: json['font_size'],
      fontStyle: json['font_style'],
      fontFamily: json['font_family'],
    );
  }
}

// BgImage Model
class BgImage {
  final String imageType;
  final String imageUrl;
  final double aspectRatio;

  BgImage({
    required this.imageType,
    required this.imageUrl,
    required this.aspectRatio,
  });

  factory BgImage.fromJson(Map<String, dynamic> json) {
    return BgImage(
      imageType: json['image_type'],
      imageUrl: json['image_url'],
      aspectRatio: (json['aspect_ratio'] as num).toDouble(),
    );
  }
}

// Cta Model
class Cta {
  final String text;
  final String type;
  final String bgColor;
  final bool isCircular;
  final bool isSecondary;
  final int strokeWidth;

  Cta({
    required this.text,
    required this.type,
    required this.bgColor,
    required this.isCircular,
    required this.isSecondary,
    required this.strokeWidth,
  });

  factory Cta.fromJson(Map<String, dynamic> json) {
    return Cta(
      text: json['text'],
      type: json['type'],
      bgColor: json['bg_color'],
      isCircular: json['is_circular'],
      isSecondary: json['is_secondary'],
      strokeWidth: json['stroke_width'],
    );
  }
}
