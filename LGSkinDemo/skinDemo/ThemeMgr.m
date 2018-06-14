//
//  ThemeMgr.m
//  skinDemo
//
//  Created by Peanut Lee on 2018/3/1.
//  Copyright © 2018年 LG. All rights reserved.
//

#import "ThemeMgr.h"
#import "TabBarViewController.h"

static NSString *currentSkinKey = @"currentSkinKey";

@interface ThemeMgr ()
/** 当前主题名 */
@property (copy,nonatomic) NSString *themeName;
/** 获取theme.plist文件所有数据 */
@property (strong,nonatomic) NSDictionary *themeDict;

@end

@implementation ThemeMgr

+ (void)switchSkinWithThemeType:(LGSkinType)skinType{
    [[self sharedInstance] switchSkinWithThemeType:skinType];
}
- (void)switchSkinWithThemeType:(LGSkinType)skinType{
    switch (skinType) {
        case LGSkinTypeDefault:
            self.themeName = @"skin_default";
            break;
        case LGSkinTypeCloud:
            self.themeName = @"skin_cloud";
            break;
        default:
            self.themeName = @"skin_default";
            break;
    }
    /// 保存到本地
    [[NSUserDefaults standardUserDefaults] setObject:@(skinType) forKey:currentSkinKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

+ (UIImage *)imageNamed:(NSString *)name{
    return [[self sharedInstance] imageNamed:name];
}
- (UIImage *)imageNamed:(NSString *)name{
    /// 获取当前皮肤路径
    NSString *prefix = [NSString stringWithFormat:@"/%@.png",name];
    NSString *imgName = [self.themePath stringByAppendingString:prefix];
    /// 生成UIImage 实例
///    UIImage *image = [UIImage imageNamed:imgName]; ///导致皮肤只能切换一次
    UIImage *image = [UIImage imageWithContentsOfFile:imgName];
    
    
    /// 如果资源文件中有jpg 格式的图片的话，其他格式同理
//    if (!image) {
//        prefix = [prefix substringToIndex:prefix.length - 4];
//        prefix = [prefix stringByAppendingString:@".jpg"];
//        imgName = [self.themePath stringByAppendingPathComponent:prefix];
//        image = [UIImage imageWithContentsOfFile:imgName];
//    }
    NSLog(@"imgname -- %@",imgName);
    return image;
}

/// 获取本地皮肤
- (LGSkinType)currentSkinType{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:currentSkinKey] integerValue];
}
/** 获取mainBundle路径 */
- (NSString *)lg_bundlePath{
    return [NSBundle mainBundle].resourcePath;
}
/// 获取主题路径
- (NSString *)themePath{
    /// 根据当前主题生成对应路径
    NSString *path =  [self.lg_bundlePath stringByAppendingPathComponent:self.themeDict[self.themeName]];
    return path;/// 例如：bundlePath/skin/default
}

- (instancetype)init{
    if (self = [super init]) {
        /// 获取 Theme.plist 中所有皮肤路径
        self.themeDict = [NSDictionary dictionaryWithContentsOfFile:[self.lg_bundlePath stringByAppendingPathComponent:@"Theme.plist"]];
        
        /// 设置初始皮肤
        LGSkinType skinType = self.currentSkinType;
        [self switchSkinWithThemeType:skinType];
    }
    return self;
}
+ (instancetype)sharedInstance{
    static id instance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

@end
