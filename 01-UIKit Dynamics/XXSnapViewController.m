//
//  XXSnapViewController.m
//  01-UIKit Dynamics
//
//  Created by shine on 2017/12/19.
//  Copyright © 2017年 shine. All rights reserved.
//

#import "XXSnapViewController.h"

@interface XXSnapViewController ()

//animator
@property (nonatomic, strong) UIDynamicAnimator *animator;

@property (weak, nonatomic) IBOutlet UIImageView *frogIV;

@end

@implementation XXSnapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (IBAction)handleTapGesture:(UITapGestureRecognizer *)sender {
    // 手指点到哪儿，就让图片瞬间移动哪儿
    CGPoint panPoint = [sender locationInView:self.view];
    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.animator = animator;
    
    UISnapBehavior *snapBehavior = [[UISnapBehavior alloc] initWithItem:self.frogIV snapToPoint:panPoint];
    snapBehavior.damping = 0.5;
    
    [self.animator addBehavior:snapBehavior];
}

@end
