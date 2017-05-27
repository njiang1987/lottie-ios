//
//  LOTScene.m
//  LottieAnimator
//
//  Created by Brandon Withrow on 12/14/15.
//  Copyright © 2015 Brandon Withrow. All rights reserved.
//

#import "LOTComposition.h"
#import "LOTLayer.h"
#import "LOTAssetGroup.h"
#import "LOTLayerGroup.h"

@implementation LOTComposition

- (instancetype)initWithJSON:(NSDictionary *)jsonDictionary {
    return [self initWithJSON:jsonDictionary imageDirectory:nil];
}

- (instancetype)initWithJSON:(NSDictionary *)jsonDictionary imageDirectory:(NSString *)imageDirectory{
    if (self = [super init]) {
        [self _mapFromJSON:jsonDictionary imageDirectory:imageDirectory];
    }
    return self;
}

- (void)_mapFromJSON:(NSDictionary *)jsonDictionary imageDirectory:(NSString *)imageDirectory {
  NSNumber *width = jsonDictionary[@"w"];
  NSNumber *height = jsonDictionary[@"h"];
  if (width && height) {
    CGRect bounds = CGRectMake(0, 0, width.floatValue, height.floatValue);
    _compBounds = bounds;
  }
  
  _startFrame = [jsonDictionary[@"ip"] copy];
  _endFrame = [jsonDictionary[@"op"] copy];
  _framerate = [jsonDictionary[@"fr"] copy];
  
  if (_startFrame && _endFrame && _framerate) {
    NSInteger frameDuration = _endFrame.integerValue - _startFrame.integerValue;
    NSTimeInterval timeDuration = frameDuration / _framerate.floatValue;
    _timeDuration = timeDuration;
  }
  
  NSArray *assetArray = jsonDictionary[@"assets"];
  if (assetArray.count) {
    _assetGroup = [[LOTAssetGroup alloc] initWithJSON:assetArray];
      _assetGroup.imageDirectory = imageDirectory;
  }
  
  NSArray *layersJSON = jsonDictionary[@"layers"];
  if (layersJSON) {
    _layerGroup = [[LOTLayerGroup alloc] initWithLayerJSON:layersJSON
                                                withBounds:_compBounds
                                             withFramerate:_framerate
                                            withAssetGroup:_assetGroup];
  }
  
  [_assetGroup finalizeInitialization];

}

@end
