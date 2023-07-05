// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

List<CategoriesModel> categoriesModelFromJson(String str) =>
    List<CategoriesModel>.from(
        json.decode(str).map((x) => CategoriesModel.fromJson(x)));

String categoriesModelToJson(List<CategoriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesModel {
  CategoriesModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.parent,
    required this.description,
    required this.display,
    required this.image,
    required this.menuOrder,
    required this.count,
    required this.links,
  });

  int id;
  String name;
  String slug;
  int parent;
  String description;
  String display;
  ImageCateg? image;
  int menuOrder;
  int count;
  Links links;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        parent: json["parent"],
        description: json["description"],
        display: json["display"],
        image: json["image"] == null
            ? ImageCateg(
                src:
                    'https://alealino.com/wp-content/uploads/woocommerce-placeholder.png',
              )
            : ImageCateg.fromJson(json["image"]),
        menuOrder: json["menu_order"],
        count: json["count"],
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "parent": parent,
        "description": description,
        "display": display,
        "image": image!.toJson(),
        "menu_order": menuOrder,
        "count": count,
        "_links": links.toJson(),
      };

  //////////////////////////////////
  CategoriesModel copyWith({
    int? id,
    String? name,
    String? slug,
    int? parent,
    String? description,
    String? display,
    ImageCateg? image,
    int? menuOrder,
    int? count,
    Links? links,
  }) =>
      CategoriesModel(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        parent: parent ?? this.parent,
        description: description ?? this.description,
        display: display ?? this.display,
        image: image ?? this.image,
        menuOrder: menuOrder ?? this.menuOrder,
        count: count ?? this.count,
        links: links ?? this.links,
      );

  /////////////////////////////////
}

class ImageCateg {
  ImageCateg({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.name,
    this.alt,
  });

  int? id;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  DateTime? dateModified;
  DateTime? dateModifiedGmt;
  String? src;
  String? name;
  String? alt;

  factory ImageCateg.fromJson(Map<String, dynamic> json) => ImageCateg(
        id: json["id"],
        dateCreated: json["date_created"] == null
            ? null
            : DateTime.parse(json["date_created"]),
        dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
        dateModified: DateTime.parse(json["date_modified"]),
        dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
        src: json["src"],
        name: json["name"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_created":
            dateCreated == null ? '' : dateCreated!.toIso8601String(),
        "date_created_gmt":
            dateCreatedGmt == null ? '' : dateCreatedGmt!.toIso8601String(),
        "date_modified":
            dateModified == null ? '' : dateModified!.toIso8601String(),
        "date_modified_gmt":
            dateModifiedGmt == null ? '' : dateModifiedGmt!.toIso8601String(),
        "src": src,
        "name": name,
        "alt": alt,
      };
}

class Links {
  Links({
    required this.self,
    required this.collection,
    required this.up,
  });

  List<Collection> self;
  List<Collection> collection;
  List<Collection>? up;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<Collection>.from(
            json["self"].map((x) => Collection.fromJson(x))),
        collection: List<Collection>.from(
            json["collection"].map((x) => Collection.fromJson(x))),
        up: json["up"] == null
            ? null
            : List<Collection>.from(
                json["up"].map((x) => Collection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "up":
            up == null ? null : List<dynamic>.from(up!.map((x) => x.toJson())),
      };
}

class Collection {
  Collection({
    required this.href,
  });

  String href;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Robots {
  Robots({
    required this.index,
    required this.follow,
    required this.maxSnippet,
    required this.maxImagePreview,
    required this.maxVideoPreview,
  });

  String index;
  String follow;
  String maxSnippet;
  String maxImagePreview;
  String maxVideoPreview;

  factory Robots.fromJson(Map<String, dynamic> json) => Robots(
        index: json["index"],
        follow: json["follow"],
        maxSnippet: json["max-snippet"],
        maxImagePreview: json["max-image-preview"],
        maxVideoPreview: json["max-video-preview"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "follow": follow,
        "max-snippet": maxSnippet,
        "max-image-preview": maxImagePreview,
        "max-video-preview": maxVideoPreview,
      };
}

class Schema {
  Schema({
    required this.context,
    required this.graph,
  });

  String context;
  List<Graph> graph;

  factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        context: json["@context"],
        graph: List<Graph>.from(json["@graph"].map((x) => Graph.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@context": context,
        "@graph": List<dynamic>.from(graph.map((x) => x.toJson())),
      };
}

class Graph {
  Graph({
    required this.type,
    required this.id,
    required this.url,
    required this.name,
    required this.isPartOf,
    required this.breadcrumb,
    required this.inLanguage,
    required this.itemListElement,
    required this.description,
    required this.publisher,
    required this.potentialAction,
    required this.logo,
    required this.image,
  });

  String? type;
  String? id;
  String? url;
  String? name;
  Breadcrumb? isPartOf;
  Breadcrumb? breadcrumb;
  String? inLanguage;
  List<ItemListElement>? itemListElement;
  String? description;
  Breadcrumb? publisher;
  List<PotentialAction>? potentialAction;
  Logo? logo;
  Breadcrumb? image;

  factory Graph.fromJson(Map<String, dynamic> json) => Graph(
        type: json["@type"],
        id: json["@id"],
        url: json["url"],
        name: json["name"],
        isPartOf: json["isPartOf"] == null
            ? null
            : Breadcrumb.fromJson(json["isPartOf"]),
        breadcrumb: json["breadcrumb"] == null
            ? null
            : Breadcrumb.fromJson(json["breadcrumb"]),
        inLanguage: json["inLanguage"],
        itemListElement: json["itemListElement"] == null
            ? null
            : List<ItemListElement>.from(json["itemListElement"]
                .map((x) => ItemListElement.fromJson(x))),
        description: json["description"],
        publisher: json["publisher"] == null
            ? null
            : Breadcrumb.fromJson(json["publisher"]),
        potentialAction: json["potentialAction"] == null
            ? null
            : List<PotentialAction>.from(json["potentialAction"]
                .map((x) => PotentialAction.fromJson(x))),
        logo: json["logo"] == null ? null : Logo.fromJson(json["logo"]),
        image:
            json["image"] == null ? null : Breadcrumb.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "@id": id,
        "url": url,
        "name": name,
        "isPartOf": isPartOf == null ? null : isPartOf!.toJson(),
        "breadcrumb": breadcrumb == null ? null : breadcrumb!.toJson(),
        "inLanguage": inLanguage,
        "itemListElement": itemListElement == null
            ? null
            : List<dynamic>.from(itemListElement!.map((x) => x.toJson())),
        "description": description,
        "publisher": publisher == null ? null : publisher!.toJson(),
        "potentialAction": potentialAction == null
            ? null
            : List<dynamic>.from(potentialAction!.map((x) => x.toJson())),
        "logo": logo == null ? null : logo!.toJson(),
        "image": image == null ? null : image!.toJson(),
      };
}

class Breadcrumb {
  Breadcrumb({
    required this.id,
  });

  String id;

  factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
        id: json["@id"],
      );

  Map<String, dynamic> toJson() => {
        "@id": id,
      };
}

class ItemListElement {
  ItemListElement({
    required this.type,
    required this.position,
    required this.name,
    required this.item,
  });

  String type;
  int position;
  String name;
  String? item;

  factory ItemListElement.fromJson(Map<String, dynamic> json) =>
      ItemListElement(
        type: json["@type"],
        position: json["position"],
        name: json["name"],
        item: json["item"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "position": position,
        "name": name,
        "item": item,
      };
}

class Logo {
  Logo({
    required this.type,
    required this.inLanguage,
    required this.id,
    required this.url,
    required this.contentUrl,
    required this.width,
    required this.height,
    required this.caption,
  });

  String type;
  String inLanguage;
  String id;
  String url;
  String contentUrl;
  int width;
  int height;
  String caption;

  factory Logo.fromJson(Map<String, dynamic> json) => Logo(
        type: json["@type"],
        inLanguage: json["inLanguage"],
        id: json["@id"],
        url: json["url"],
        contentUrl: json["contentUrl"],
        width: json["width"],
        height: json["height"],
        caption: json["caption"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "inLanguage": inLanguage,
        "@id": id,
        "url": url,
        "contentUrl": contentUrl,
        "width": width,
        "height": height,
        "caption": caption,
      };
}

class PotentialAction {
  PotentialAction({
    required this.type,
    required this.target,
    required this.queryInput,
  });

  String type;
  Target target;
  String queryInput;

  factory PotentialAction.fromJson(Map<String, dynamic> json) =>
      PotentialAction(
        type: json["@type"],
        target: Target.fromJson(json["target"]),
        queryInput: json["query-input"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "target": target.toJson(),
        "query-input": queryInput,
      };
}

class Target {
  Target({
    required this.type,
    required this.urlTemplate,
  });

  String type;
  String urlTemplate;

  factory Target.fromJson(Map<String, dynamic> json) => Target(
        type: json["@type"],
        urlTemplate: json["urlTemplate"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "urlTemplate": urlTemplate,
      };
}
