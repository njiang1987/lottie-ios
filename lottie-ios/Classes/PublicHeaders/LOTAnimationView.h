//
//  LOTAnimationView
//  LottieAnimator
//
//  Created by Brandon Withrow on 12/14/15.
//  Copyright © 2015 Brandon Withrow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LOTAnimationView_Compat.h"

typedef void (^LOTAnimationCompletionBlock)(BOOL animationFinished);

@interface LOTAnimationView : LOTView

+ (instancetype)animationNamed:(NSString *)animationName NS_SWIFT_NAME(init(name:));
+ (instancetype)animationNamed:(NSString *)animationName inBundle:(NSBundle *)bundle NS_SWIFT_NAME(init(name:bundle:));
+ (instancetype)animationFromJSON:(NSDictionary *)animationJSON NS_SWIFT_NAME(init(json:));

/**
 * 通过文件夹的路径初始化动画，
 * 动画的json必须为: data.json
 * 图片的路径必须为: images/
 */
+ (instancetype)animationFromDirectory:(NSString *)directory;
+ (instancetype)animationFromDirectory:(NSString *)directory json:(NSString *)json imageDirectory:(NSString *)imageDirectory;

- (instancetype)initWithContentsOfURL:(NSURL *)url;

@property (nonatomic, readonly) BOOL isAnimationPlaying;
@property (nonatomic, assign) BOOL loopAnimation;
@property (nonatomic, assign) CGFloat animationProgress;
@property (nonatomic, assign) CGFloat animationSpeed;
@property (nonatomic, readonly) CGFloat animationDuration;

- (void)playWithCompletion:(LOTAnimationCompletionBlock)completion;
- (void)play;
- (void)pause;

- (void)addSubview:(LOTView *)view
      toLayerNamed:(NSString *)layer;

#if !TARGET_OS_IPHONE && !TARGET_IPHONE_SIMULATOR
@property (nonatomic) LOTViewContentMode contentMode;
#endif

@end
