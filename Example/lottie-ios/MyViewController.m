//
//  MyViewController.m
//  lottie-ios
//
//  Created by jingsong.jn on 2017/5/27.
//  Copyright © 2017年 Brandon Withrow. All rights reserved.
//

#import "MyViewController.h"
#import <Lottie/Lottie.h>

@interface MyViewController ()

@property (nonatomic, strong) LOTAnimationView *animationView;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSError *error;
//    NSString *filePath = @"/Users/jingsong.jn/Desktop/test/chenggong/data.json";
//    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:filePath];
//    NSDictionary  *JSONObject = jsonData ? [NSJSONSerialization JSONObjectWithData:jsonData
//                                                                           options:0 error:&error] : nil;
    
//    self.animationView = [LOTAnimationView animationNamed:@"/Users/jingsong.jn/Desktop/test/chenggong/data.json"];
    self.animationView = [LOTAnimationView animationFromDirectory:@"/Users/jingsong.jn/Desktop/test/chenggong/"];
    [self.view addSubview:self.animationView];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.animationView.frame = self.view.bounds;
    [self.animationView playWithCompletion:^(BOOL animationFinished) {
        NSLog(@"finish");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
