//
//  XXSpringsViewController.m
//  01-UIKit Dynamics
//
//  Created by shine on 2017/12/19.
//  Copyright © 2017年 shine. All rights reserved.
//

// 弹跳效果是对附着效果的延伸，修改附着行为的几个参数即可得到

#import "XXSpringsViewController.h"

@interface XXSpringsViewController ()
//animator
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (weak, nonatomic) IBOutlet UIImageView *frogIV;
@property (weak, nonatomic) IBOutlet UIImageView *dragonIV;

@end

@implementation XXSpringsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self startAnimator];
    
    
}

- (void)startAnimator {
    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.animator = animator;
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.frogIV, self.dragonIV]];
    collisionBehavior.collisionMode = UICollisionBehaviorModeBoundaries;
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.dragonIV]];
    
    CGPoint frogCenter = CGPointMake(self.frogIV.center.x, self.frogIV.center.y);
    UIAttachmentBehavior *attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:self.dragonIV attachedToAnchor:frogCenter];
    attachmentBehavior.frequency = 1.0f;  //越大晃动越快
    attachmentBehavior.damping = 0.1f; //越小晃动幅度越大
    attachmentBehavior.length = 100.0f; //越大距离附着的点越远
    
    [animator addBehavior:collisionBehavior];
    [animator addBehavior:gravityBehavior];
    [animator addBehavior:attachmentBehavior];
    
    
    
}

@end
