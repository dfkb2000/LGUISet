//
//  ViewController.m
//  0228_biaoqian_demo
//
//  Created by user on 17/2/28.
//  Copyright © 2017年 Len. All rights reserved.
//

#define margin 5
#define btnH 40

#import "ViewController.h"
#import "TOPMarkView.h"

@interface ViewController ()
@property (strong, nonatomic) TOPMarkView *v;
@property (assign,nonatomic) CGRect v_frame;
@property (strong,nonatomic) NSMutableArray *arr;

@property (assign,nonatomic) CGFloat btnTotalW;
@property (assign,nonatomic) CGFloat btnTotalH;

@end

@implementation ViewController

- (IBAction)clear:(id)sender {
    [_arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = (UIButton *)obj;
        [button removeFromSuperview];
    }];
    _btnTotalH = 0;
    _btnTotalW = 0;
    [_arr removeAllObjects];
    _v.frame = _v_frame;
}

- (IBAction)add:(id)sender {
    
    for (NSInteger i = 0; i < 18; ++i) {

        UIButton *button = [self buttonWith:[NSString stringWithFormat:@"123木头人_%zd",i] frame:CGRectZero];
        [_arr addObject:button];
    }
    _v.array = _arr;
    
//    if (self.arr.count == 0) {
//        UIButton *button = [self buttonWith:@"123木头人" frame:CGRectMake(margin, margin, 0, btnH)];
//        [_arr addObject:button];
//        [_v addSubview:button];
//        _btnTotalW += button.frame.size.width + margin;
//        _btnTotalH = button.frame.size.height + margin;
//    }else{
//        UIButton *lastButton = [_arr lastObject];
//        CGRect lastFrame = lastButton.frame;
//        
//        CGFloat x = CGRectGetMaxX(lastFrame) + margin;
//        CGFloat y = lastFrame.origin.y;
//        
//        CGRect frame = CGRectZero;
//        
//        UIButton *button = [self buttonWith:[NSString stringWithFormat:@"123木头人_%zd",_arr.count] frame:frame];
//        
//        _btnTotalW += button.frame.size.width + margin;
//        
//        if (_btnTotalW >= [UIScreen mainScreen].bounds.size.width) {
//            // 换行
//            x = margin;
//            y = CGRectGetMaxY(lastFrame) + margin;
//            _btnTotalW = button.frame.size.width + margin;
//            
//            _btnTotalH += button.frame.size.height + margin;
//            
//            if (_btnTotalH >= _v.frame.size.height) {
//                CGRect frame = _v.frame;
//                frame.size.height = _btnTotalH + margin;
//                _v.frame = frame;
//            }
//        }else{
//
//        }
//        
//        [button sizeToFit];
//        frame = CGRectMake(x, y, button.bounds.size.width, btnH);
//        button.frame = frame;
//        
//        [_arr addObject:button];
//        [_v addSubview:button];
//        
//    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _arr = [NSMutableArray arrayWithCapacity:10];
    
    _v = [[TOPMarkView alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 200)];
    _v_frame = _v.frame;
    [self.view addSubview:_v];
}

- (UIButton *)buttonWith:(NSString *)text frame:(CGRect)frame{
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button sizeToFit];
    
    frame.size.height = btnH;
    frame.size.width = button.bounds.size.width;
    
    button.frame = frame;
    
    return button;
}

- (NSMutableArray *)arr{
    if (_arr == nil) {
        _arr = [NSMutableArray arrayWithCapacity:10];
    }
    return _arr;
}

@end
