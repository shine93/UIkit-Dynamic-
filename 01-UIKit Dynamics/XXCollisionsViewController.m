//
//  XXCollisionsViewController.m
//  01-UIKit Dynamics
//
//  Created by shine on 2017/12/19.
//  Copyright © 2017年 shine. All rights reserved.
//

#import "XXCollisionsViewController.h"

@interface XXCollisionsViewController ()<UICollisionBehaviorDelegate>

//animator
@property (nonatomic, strong) UIDynamicAnimator *animator;

@property (weak, nonatomic) IBOutlet UIImageView *dragonIV;
@property (weak, nonatomic) IBOutlet UIImageView *frogIV;
@property (weak, nonatomic) IBOutlet UILabel *dragonL;
@property (weak, nonatomic) IBOutlet UILabel *frogL;

@end

@implementation XXCollisionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self startCollidesion];
}


- (void)startCollidesion {
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    //重力行为
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.frogIV, self.dragonIV]];
    gravityBehavior.gravityDirection = CGVectorMake(0.0, 0.1);
    
    //碰撞行为
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.frogIV, self.dragonIV]];
    collisionBehavior.collisionMode = UICollisionBehaviorModeEverything;
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    collisionBehavior.collisionDelegate = self;
    
    [self.animator addBehavior:gravityBehavior];
    [self.animator addBehavior:collisionBehavior];
    
    
    
}

#pragma mark - UICollisionBehaviorDelegate

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(nonnull id<UIDynamicItem>)item withBoundaryIdentifier:(nullable id<NSCopying>)identifier atPoint:(CGPoint)p {
    
    if ([item isEqual:self.dragonIV]) {
        self.dragonL.text = @"龙撞击到了地面";
    }
    if ([item isEqual:self.frogIV]) {
        self.frogL.text = @"青蛙撞击到了地面";
    }
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier {
    NSLog(@"撞击结束");
}

@end
