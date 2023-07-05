import 'dart:convert';

List<MediaWpModel> mediaWpModelFromJson(String str) => List<MediaWpModel>.from(
    json.decode(str).map((x) => MediaWpModel.fromJson(x)));

String mediaWpModelToJson(List<MediaWpModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MediaWpModel {
  int id;
  DateTime date;
  DateTime dateGmt;
  Caption guid;
  DateTime modified;
  DateTime modifiedGmt;
  String slug;
  String status;
  String type;
  String link;
  Caption title;
  int author;
  String commentStatus;
  String pingStatus;
  String template;
  Meta meta;
  Caption description;
  Caption caption;
  String altText;
  String mediaType;
  String mimeType;
  MediaDetails mediaDetails;
  int? post;
  String sourceUrl;
  Links links;

  MediaWpModel({
    required this.id,
    required this.date,
    required this.dateGmt,
    required this.guid,
    required this.modified,
    required this.modifiedGmt,
    required this.slug,
    required this.status,
    required this.type,
    required this.link,
    required this.title,
    required this.author,
    required this.commentStatus,
    required this.pingStatus,
    required this.template,
    required this.meta,
    required this.description,
    required this.caption,
    required this.altText,
    required this.mediaType,
    required this.mimeType,
    required this.mediaDetails,
    this.post,
    required this.sourceUrl,
    required this.links,
  });

  MediaWpModel copyWith({
    int? id,
    DateTime? date,
    DateTime? dateGmt,
    Caption? guid,
    DateTime? modified,
    DateTime? modifiedGmt,
    String? slug,
    String? status,
    String? type,
    String? link,
    Caption? title,
    int? author,
    String? commentStatus,
    String? pingStatus,
    String? template,
    Meta? meta,
    Caption? description,
    Caption? caption,
    String? altText,
    String? mediaType,
    String? mimeType,
    MediaDetails? mediaDetails,
    int? post,
    String? sourceUrl,
    Links? links,
  }) =>
      MediaWpModel(
        id: id ?? this.id,
        date: date ?? this.date,
        dateGmt: dateGmt ?? this.dateGmt,
        guid: guid ?? this.guid,
        modified: modified ?? this.modified,
        modifiedGmt: modifiedGmt ?? this.modifiedGmt,
        slug: slug ?? this.slug,
        status: status ?? this.status,
        type: type ?? this.type,
        link: link ?? this.link,
        title: title ?? this.title,
        author: author ?? this.author,
        commentStatus: commentStatus ?? this.commentStatus,
        pingStatus: pingStatus ?? this.pingStatus,
        template: template ?? this.template,
        meta: meta ?? this.meta,
        description: description ?? this.description,
        caption: caption ?? this.caption,
        altText: altText ?? this.altText,
        mediaType: mediaType ?? this.mediaType,
        mimeType: mimeType ?? this.mimeType,
        mediaDetails: mediaDetails ?? this.mediaDetails,
        post: post ?? this.post,
        sourceUrl: sourceUrl ?? this.sourceUrl,
        links: links ?? this.links,
      );

  factory MediaWpModel.fromJson(Map<String, dynamic> json) => MediaWpModel(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Caption.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: json["status"],
        type: json["type"],
        link: json["link"],
        title: Caption.fromJson(json["title"]),
        author: json["author"],
        commentStatus: json["comment_status"],
        pingStatus: json["ping_status"],
        template: json["template"],
        meta: Meta.fromJson(json["meta"]),
        description: Caption.fromJson(json["description"]),
        caption: Caption.fromJson(json["caption"]),
        altText: json["alt_text"],
        mediaType: json["media_type"],
        mimeType: json["mime_type"],
        mediaDetails: MediaDetails.fromJson(json["media_details"]),
        post: json["post"],
        sourceUrl: json["source_url"],
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "date_gmt": dateGmt.toIso8601String(),
        "guid": guid.toJson(),
        "modified": modified.toIso8601String(),
        "modified_gmt": modifiedGmt.toIso8601String(),
        "slug": slug,
        "status": status,
        "type": type,
        "link": link,
        "title": title.toJson(),
        "author": author,
        "comment_status": commentStatus,
        "ping_status": pingStatus,
        "template": template,
        "meta": meta.toJson(),
        "description": description.toJson(),
        "caption": caption.toJson(),
        "alt_text": altText,
        "media_type": mediaType,
        "mime_type": mimeType,
        "media_details": mediaDetails.toJson(),
        "post": post,
        "source_url": sourceUrl,
        "_links": links.toJson(),
      };
}

class Caption {
  String rendered;

  Caption({
    required this.rendered,
  });

  Caption copyWith({
    String? rendered,
  }) =>
      Caption(
        rendered: rendered ?? this.rendered,
      );

  factory Caption.fromJson(Map<String, dynamic> json) => Caption(
        rendered: json["rendered"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };
}

class Links {
  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<Author>? author;
  List<Author>? replies;

  Links({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
  });

  Links copyWith({
    List<About>? self,
    List<About>? collection,
    List<About>? about,
    List<Author>? author,
    List<Author>? replies,
  }) =>
      Links(
        self: self ?? this.self,
        collection: collection ?? this.collection,
        about: about ?? this.about,
        author: author ?? this.author,
        replies: replies ?? this.replies,
      );

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"] == null
            ? null
            : List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection: json["collection"] == null
            ? null
            : List<About>.from(
                json["collection"].map((x) => About.fromJson(x))),
        about: json["about"] == null
            ? null
            : List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author: json["author"] == null
            ? null
            : List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
        replies: json["replies"] == null
            ? null
            : List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection!.map((x) => x.toJson())),
        "about": List<dynamic>.from(about!.map((x) => x.toJson())),
        "author": List<dynamic>.from(author!.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies!.map((x) => x.toJson())),
      };
}

class About {
  String href;

  About({
    required this.href,
  });

  About copyWith({
    String? href,
  }) =>
      About(
        href: href ?? this.href,
      );

  factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Author {
  bool embeddable;
  String href;

  Author({
    required this.embeddable,
    required this.href,
  });

  Author copyWith({
    bool? embeddable,
    String? href,
  }) =>
      Author(
        embeddable: embeddable ?? this.embeddable,
        href: href ?? this.href,
      );

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
      };
}

class MediaDetails {
  int? width;
  int? height;
  String? file;
  int? filesize;
  Sizes? sizes;
  ImageMeta? imageMeta;

  MediaDetails({
    this.width,
    this.height,
    this.file,
    this.filesize,
    this.sizes,
    this.imageMeta,
  });

  MediaDetails copyWith({
    int? width,
    int? height,
    String? file,
    int? filesize,
    Sizes? sizes,
    ImageMeta? imageMeta,
  }) =>
      MediaDetails(
        width: width ?? this.width,
        height: height ?? this.height,
        file: file ?? this.file,
        filesize: filesize ?? this.filesize,
        sizes: sizes ?? this.sizes,
        imageMeta: imageMeta ?? this.imageMeta,
      );

  factory MediaDetails.fromJson(Map<String, dynamic> json) => MediaDetails(
        width: json["width"],
        height: json["height"],
        file: json["file"],
        filesize: json["filesize"],
        sizes: Sizes.fromJson(json["sizes"]),
        imageMeta: json["image_meta"] == null
            ? null
            : ImageMeta.fromJson(json["image_meta"]),
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "file": file,
        "filesize": filesize,
        "sizes": sizes!.toJson(),
        "image_meta": imageMeta!.toJson(),
      };
}

class ImageMeta {
  String aperture;
  String credit;
  String camera;
  String caption;
  String createdTimestamp;
  String copyright;
  String focalLength;
  String iso;
  String shutterSpeed;
  String title;
  List<dynamic> keywords;

  ImageMeta({
    required this.aperture,
    required this.credit,
    required this.camera,
    required this.caption,
    required this.createdTimestamp,
    required this.copyright,
    required this.focalLength,
    required this.iso,
    required this.shutterSpeed,
    required this.title,
    required this.keywords,
  });

  ImageMeta copyWith({
    String? aperture,
    String? credit,
    String? camera,
    String? caption,
    String? createdTimestamp,
    String? copyright,
    String? focalLength,
    String? iso,
    String? shutterSpeed,
    String? title,
    List<dynamic>? keywords,
  }) =>
      ImageMeta(
        aperture: aperture ?? this.aperture,
        credit: credit ?? this.credit,
        camera: camera ?? this.camera,
        caption: caption ?? this.caption,
        createdTimestamp: createdTimestamp ?? this.createdTimestamp,
        copyright: copyright ?? this.copyright,
        focalLength: focalLength ?? this.focalLength,
        iso: iso ?? this.iso,
        shutterSpeed: shutterSpeed ?? this.shutterSpeed,
        title: title ?? this.title,
        keywords: keywords ?? this.keywords,
      );

  factory ImageMeta.fromJson(Map<String, dynamic> json) => ImageMeta(
        aperture: json["aperture"],
        credit: json["credit"],
        camera: json["camera"],
        caption: json["caption"],
        createdTimestamp: json["created_timestamp"],
        copyright: json["copyright"],
        focalLength: json["focal_length"],
        iso: json["iso"],
        shutterSpeed: json["shutter_speed"],
        title: json["title"],
        keywords: List<dynamic>.from(json["keywords"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "aperture": aperture,
        "credit": credit,
        "camera": camera,
        "caption": caption,
        "created_timestamp": createdTimestamp,
        "copyright": copyright,
        "focal_length": focalLength,
        "iso": iso,
        "shutter_speed": shutterSpeed,
        "title": title,
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
      };
}

class Sizes {
  Full? medium;
  Full? thumbnail;
  Full? woocommerceThumbnail;
  Full? woocommerceGalleryThumbnail;
  Full? full;

  Sizes({
    this.medium,
    this.thumbnail,
    this.woocommerceThumbnail,
    this.woocommerceGalleryThumbnail,
    this.full,
  });

  Sizes copyWith({
    Full? medium,
    Full? thumbnail,
    Full? woocommerceThumbnail,
    Full? woocommerceGalleryThumbnail,
    Full? full,
  }) =>
      Sizes(
        medium: medium ?? this.medium,
        thumbnail: thumbnail ?? this.thumbnail,
        woocommerceThumbnail: woocommerceThumbnail ?? this.woocommerceThumbnail,
        woocommerceGalleryThumbnail:
            woocommerceGalleryThumbnail ?? this.woocommerceGalleryThumbnail,
        full: full ?? this.full,
      );

  factory Sizes.fromJson(Map<String, dynamic> json) => Sizes(
        medium: json["medium"] == null ? null : Full.fromJson(json["medium"]),
        thumbnail:
            json["thumbnail"] == null ? null : Full.fromJson(json["thumbnail"]),
        woocommerceThumbnail: json["woocommerce_thumbnail"] == null
            ? null
            : Full.fromJson(json["woocommerce_thumbnail"]),
        woocommerceGalleryThumbnail:
            json["woocommerce_gallery_thumbnail"] == null
                ? null
                : Full.fromJson(json["woocommerce_gallery_thumbnail"]),
        full: json["full"] == null ? null : Full.fromJson(json["full"]),
      );

  Map<String, dynamic> toJson() => {
        "medium": medium!.toJson(),
        "thumbnail": thumbnail!.toJson(),
        "woocommerce_thumbnail": woocommerceThumbnail!.toJson(),
        "woocommerce_gallery_thumbnail": woocommerceGalleryThumbnail!.toJson(),
        "full": full!.toJson(),
      };
}

class Full {
  String file;
  int width;
  int height;
  String mimeType;
  String sourceUrl;
  int? filesize;
  bool? uncropped;

  Full({
    required this.file,
    required this.width,
    required this.height,
    required this.mimeType,
    required this.sourceUrl,
    this.filesize,
    this.uncropped,
  });

  Full copyWith({
    String? file,
    int? width,
    int? height,
    String? mimeType,
    String? sourceUrl,
    int? filesize,
    bool? uncropped,
  }) =>
      Full(
        file: file ?? this.file,
        width: width ?? this.width,
        height: height ?? this.height,
        mimeType: mimeType ?? this.mimeType,
        sourceUrl: sourceUrl ?? this.sourceUrl,
        filesize: filesize ?? this.filesize,
        uncropped: uncropped ?? this.uncropped,
      );

  factory Full.fromJson(Map<String, dynamic> json) => Full(
        file: json["file"],
        width: json["width"],
        height: json["height"],
        mimeType: json["mime_type"],
        sourceUrl: json["source_url"],
        filesize: json["filesize"],
        uncropped: json["uncropped"],
      );

  Map<String, dynamic> toJson() => {
        "file": file,
        "width": width,
        "height": height,
        "mime_type": mimeType,
        "source_url": sourceUrl,
        "filesize": filesize,
        "uncropped": uncropped,
      };
}

class Meta {
  bool themeisleGutenbergBlockHasReview;

  Meta({
    required this.themeisleGutenbergBlockHasReview,
  });

  Meta copyWith({
    bool? themeisleGutenbergBlockHasReview,
  }) =>
      Meta(
        themeisleGutenbergBlockHasReview: themeisleGutenbergBlockHasReview ??
            this.themeisleGutenbergBlockHasReview,
      );

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        themeisleGutenbergBlockHasReview:
            json["_themeisle_gutenberg_block_has_review"],
      );

  Map<String, dynamic> toJson() => {
        "_themeisle_gutenberg_block_has_review":
            themeisleGutenbergBlockHasReview,
      };
}
