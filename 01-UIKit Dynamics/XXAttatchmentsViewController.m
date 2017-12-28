//
//  XXAttatchmentsViewController.m
//  01-UIKit Dynamics
//
//  Created by shine on 2017/12/19.
//  Copyright © 2017年 shine. All rights reserved.
//

// 移动青蛙图片，图片会抖动，如何解决？？？

#import "XXAttatchmentsViewController.h"

@interface XXAttatchmentsViewController ()
//animator
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIAttachmentBehavior *attachmentBehavior;

@property (weak, nonatomic) IBOutlet UIImageView *frogIV;
@property (weak, nonatomic) IBOutlet UIImageView *dragonIV;

@end

@implementation XXAttatchmentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self startAnimator];
}

- (void)startAnimator {
    //添加碰撞行为
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.frogIV, self.dragonIV]];
    collisionBehavior.collisionMode = UICollisionBehaviorModeBoundaries;
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    [self.animator addBehavior:collisionBehavior];
    
    //添加附着行为
    CGPoint frogCenter = CGPointMake(self.frogIV.center.x, self.frogIV.center.y);
    
    //让龙的图片随着青蛙的中心点运动
    UIAttachmentBehavior *attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:self.dragonIV attachedToAnchor:frogCenter];
    self.attachmentBehavior = attachmentBehavior;
    
    [self.animator addBehavior:attachmentBehavior];
}

//让青蛙图片可以移动
- (IBAction)handleAttachmentGesture:(UIPanGestureRecognizer *)sender {
    //将拖动的点设置为青蛙图片的中心点
    CGPoint panPoint = [sender locationInView:self.view];
    self.frogIV.center = panPoint;
    
    self.attachmentBehavior.anchorPoint = panPoint;
    
    
    
}




@end
