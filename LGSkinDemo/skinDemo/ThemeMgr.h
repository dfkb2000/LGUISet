//
//  ThemeMgr.h
//  skinDemo
//
//  Created by Peanut Lee on 2018/3/1.
//  Copyright © 2018年 LG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//static NSString *kNotificationSkinSwitch = @"kNotificationSkinSwitch";

typedef NS_ENUM(NSUInteger, LGSkinType) {
    LGSkinTypeDefault = 1,
    LGSkinTypeCloud
};

@interface ThemeMgr : NSObject

/** 切换皮肤 */
+ (void)switchSkinWithThemeType:(LGSkinType)skinType;

/** 返回皮肤图片资源文件 */
+ (UIImage *)imageNamed:(NSString *)name;

+ (instancetype)sharedInstance;
@end
