//
//  BaseViewController.m
//  skinDemo
//
//  Created by Peanut Lee on 2018/3/1.
//  Copyright © 2018年 LG. All rights reserved.
//

#import "BaseViewController.h"
#import "TabBarViewController.h"
#import "ThemeMgr.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)lg_default:(UIButton *)sender{
    [ThemeMgr switchSkinWithThemeType:LGSkinTypeDefault];
    [UIApplication sharedApplication].keyWindow.rootViewController = [TabBarViewController new];
}
- (void)cloud:(UIButton *)sender{
    [ThemeMgr switchSkinWithThemeType:LGSkinTypeCloud];
    [UIApplication sharedApplication].keyWindow.rootViewController = [TabBarViewController new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat BW = 100;
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(BW, BW, BW, BW)];
    [button setTitle:@"默认皮肤" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(lg_default:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button_cloud = [[UIButton alloc] initWithFrame:CGRectMake(BW, BW * 2, BW, BW)];
    [button_cloud setTitle:@"水墨祥云" forState:UIControlStateNormal];
    [button_cloud setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button_cloud addTarget:self action:@selector(cloud:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_cloud];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(BW, BW * 3, 0, 0)];
    imageView.image = [ThemeMgr imageNamed:@"icon_tabbar_selected_bookstore"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [imageView sizeToFit];
    [self.view addSubview:imageView];
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
