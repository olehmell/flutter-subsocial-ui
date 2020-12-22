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
      @required this.updatedAtBlock,
      @required this.updatedAtTime,
      @required this.updatedBy,
      @required this.ownerId,
      @required this.contentId,
      @required this.isIpfsContent,
      @required this.isHidden,
      @required this.followersCount,
      @required this.postsCount,
      @required this.visiblePostsCount,
      @required this.hiddenPostsCount,
      @required this.score,
      this.parentId,
      this.handle});

  static fromJson(Map<String, dynamic> parsedJson) {
    return Space(
        id: parsedJson['id'],
        createdAtBlock: parsedJson['createdAtBlock'],
        createdAtTime: parsedJson['createdAtTime'],
        createdBy: parsedJson['createdAtTime'],
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
