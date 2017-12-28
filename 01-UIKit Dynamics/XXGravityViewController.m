//
//  XXGravityViewController.m
//  01-UIKit Dynamics
//
//  Created by shine on 2017/12/19.
//  Copyright © 2017年 shine. All rights reserved.
//  重力下降

#import "XXGravityViewController.h"

@interface XXGravityViewController ()
{
    UIDynamicAnimator *animator;
}

//ballView
@property (nonatomic, strong) UIView *ballView;

@end

@implementation XXGravityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //UI
    [self setupUI];
    
    //设置自由落体
    [self startAnimation];
    
}


- (void)startAnimation {
    //animator必须是全局的，要不然没有动画效果
//    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.ballView]];
    [gravityBehavior setGravityDirection:CGVectorMake(0.0f, 0.1f)];
    [animator addBehavior:gravityBehavior];
    
    
}

- (void)setupUI {
    //放一个球，设置一些属性，让其依据重力自由落体
    UIView *ballView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 50, 50)];
    ballView.backgroundColor = [UIColor redColor];
    self.ballView = ballView;
    [self.view addSubview:ballView];
}



@end
