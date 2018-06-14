//
//  TabBarViewController.m
//  skinDemo
//
//  Created by Peanut Lee on 2018/3/1.
//  Copyright © 2018年 LG. All rights reserved.
//

#import "TabBarViewController.h"
#import "BaseViewController.h"
#import "ThemeMgr.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self lg_setChileVcWithTitle:@"首页"
               iconImgNameNormal:@"icon_tabbar_unSelected_bookshelf"
             iconImgNameSelected:@"icon_tabbar_selected_bookshelf"];
    
    [self lg_setChileVcWithTitle:@"发现"
               iconImgNameNormal:@"icon_tabbar_unSelected_bookstore"
             iconImgNameSelected:@"icon_tabbar_selected_bookstore"];
    
    [self lg_setChileVcWithTitle:@"我的"
               iconImgNameNormal:@"icon_tabbar_unSelected_user"
             iconImgNameSelected:@"icon_tabbar_selected_user"];
    
}

- (void)lg_setChileVcWithTitle:(NSString *)title iconImgNameNormal:(NSString *)normal iconImgNameSelected:(NSString *)selected {
    BaseViewController *vc = [BaseViewController new];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    vc.title = title;
    
    vc.tabBarItem.image = [[ThemeMgr imageNamed:normal] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[ThemeMgr imageNamed:selected] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

//    vc.tabBarItem.image = [[UIImage imageNamed:normal] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selected] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self addChildViewController:nav];
}


@end
