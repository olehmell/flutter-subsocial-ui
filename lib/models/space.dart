import 'package:flutter/material.dart';

class Space {
  num id;

  num createdAtBlock;
  num createdAtTime;
  String createdBy;

  bool isUpdated;
  num updatedAtBlock;
  num updatedAtTime;
  String updatedBy;

  String ownerId;

  num parentId;

  String handle;

  String contentId;
  bool isIpfsContent;

  bool isHidden;

  num followersCount;
  num postsCount;
  num visiblePostsCount;
  num hiddenPostsCount;

  num score;

  Space(
      {@required this.id,
      @required this.createdAtBlock,
      @required this.createdAtTime,
      @required this.createdBy,
      @required this.isUpdated,
      @required this.ownerId,
      @required this.contentId,
      @required this.isIpfsContent,
      @required this.isHidden,
      @required this.followersCount,
      @required this.postsCount,
      @required this.visiblePostsCount,
      @required this.hiddenPostsCount,
      @required this.score,
      this.updatedAtBlock,
      this.updatedAtTime,
      this.updatedBy,
      this.parentId,
      this.handle});

  static Space fromJson(Map<String, dynamic> parsedJson) {
    print('In fromJson method');
    return Space(
        id: parsedJson['id'],
        createdAtBlock: parsedJson['createdAtBlock'],
        createdAtTime: parsedJson['createdAtTime'],
        createdBy: parsedJson['createdBy'],
        isUpdated: parsedJson['isUpdated'],
        updatedAtBlock: parsedJson['updatedAtBlock'],
        updatedAtTime: parsedJson['updatedAtTime'],
        updatedBy: parsedJson['updatedBy'],
        ownerId: parsedJson['ownerId'],
        handle: parsedJson['handle'],
        contentId: parsedJson['contentId'],
        isIpfsContent: parsedJson['isIpfsContent'],
        isHidden: parsedJson['isHidden'],
        followersCount: parsedJson['followersCount'],
        postsCount: parsedJson['postsCount'],
        visiblePostsCount: parsedJson['visiblePostsCount'],
        hiddenPostsCount: parsedJson['hiddenPostsCount'],
        score: parsedJson['score']);
  }
}

class SpaceContent {
  String name;
  String about;
  String image;
  String email;
  List<String> tags;
  List<String> links;

  SpaceContent(
      {@required this.name,
      this.about,
      this.email,
      this.image,
      this.links,
      this.tags});

  static SpaceContent fromJson(Map<String, dynamic> parsedJson) {
    return SpaceContent(
      name: parsedJson['name'],
      about: parsedJson['about'],
      email: parsedJson['email'],
      links: parsedJson['links'],
      tags: parsedJson['tags'],
    );
  }
}

class SpaceData {
  final Space struct;
  final SpaceContent content;

  SpaceData({@required this.struct, this.content});
}
