//
//  TOPMarkView.m
//  0228_biaoqian_demo
//
//  Created by user on 17/3/23.
//  Copyright © 2017年 Len. All rights reserved.
//

#define margin 5
#define btnH 40

#import "TOPMarkView.h"

@interface TOPMarkView ()
@property (assign,nonatomic) CGFloat btnTotalW;
@property (assign,nonatomic) CGFloat btnTotalH;

@end

@implementation TOPMarkView

- (void)setArray:(NSMutableArray *)array{
    _array = array;
    
    if (array.count == 0) {
    }else{
        
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            UIButton *button;
            if (idx > 0) {// 之后的所有按钮
                UIButton *lastButton = array[idx - 1];
                CGRect lastFrame = lastButton.frame;
                CGFloat x = CGRectGetMaxX(lastFrame) + margin;
                CGFloat y = lastFrame.origin.y;
                
                CGRect frame = CGRectZero;
                button = (UIButton *)obj;
                _btnTotalW += button.frame.size.width + margin;
                if (_btnTotalW >= [UIScreen mainScreen].bounds.size.width) {
                    // 换行
                    x = margin;
                    y = CGRectGetMaxY(lastFrame) + margin;
                    _btnTotalW = button.frame.size.width + margin;
                    
                    _btnTotalH += button.frame.size.height + margin;
                    
                    if (_btnTotalH >= self.frame.size.height) {
                        CGRect frame = self.frame;
                        frame.size.height = _btnTotalH + margin;
                        self.frame = frame;
                    }
                }else{
                    
                }
                
                [button sizeToFit];
                frame = CGRectMake(x, y, button.bounds.size.width, btnH);
                button.frame = frame;
                
                [self addSubview:button];
                
            }else{
                button = (UIButton *)obj;// 第一个按钮
                button.frame = CGRectMake(margin, margin, button.bounds.size.width, btnH);
                [self addSubview:button];
                _btnTotalW += button.frame.size.width + margin;
                _btnTotalH = button.frame.size.height + margin;
            }
            NSLog(@"%zd.frame: %@",idx,NSStringFromCGRect(button.frame));
            
        }];
 
    }
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}


@end
