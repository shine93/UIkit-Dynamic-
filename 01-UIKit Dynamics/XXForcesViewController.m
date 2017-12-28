//
//  XXForcesViewController.m
//  01-UIKit Dynamics
//
//  Created by shine on 2017/12/19.
//  Copyright © 2017年 shine. All rights reserved.
//

// 推力的方向是如何控制的

#import "XXForcesViewController.h"

@interface XXForcesViewController ()

//animator
@property (nonatomic, strong) UIDynamicAnimator *animator;

//pushBehavior
@property (nonatomic, strong) UIPushBehavior *pushBehavior;

@property (weak, nonatomic) IBOutlet UIImageView *dragonIV;

@end

@implementation XXForcesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self startAnimator];
    
}

- (void)startAnimator {
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.animator = animator;
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.dragonIV]];
    collisionBehavior.collisionMode = UICollisionBehaviorModeBoundaries;
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[self.dragonIV] mode:UIPushBehaviorModeContinuous];
    self.pushBehavior = pushBehavior;
    pushBehavior.magnitude = 0.0;
    pushBehavior.angle = 0.0;
    
    [self.animator addBehavior:collisionBehavior];
    [self.animator addBehavior:pushBehavior];
    
    
}


- (IBAction)handlePanGesture:(UIPanGestureRecognizer *)sender {
    //根据移动的点计算推力的角度和距离、
    if (sender.state == UIGestureRecognizerStateEnded) {
        CGPoint panPoint = [sender locationInView:self.view];
        
        CGPoint originPoint = CGPointMake(CGRectGetMidX(self.dragonIV.bounds), CGRectGetMidY(self.dragonIV.bounds));
        
        CGFloat angle = atan2(panPoint.y - originPoint.y, panPoint.x - originPoint.x);
        CGFloat distance = sqrtf(powf(panPoint.x - originPoint.x, 2) + powf(panPoint.y - originPoint.y, 2));
        distance = MIN(distance, 100);
        
        
        self.pushBehavior.magnitude = distance/100;
        self.pushBehavior.angle = angle;
        self.pushBehavior.active = YES;

    }
    
    
}


@end
