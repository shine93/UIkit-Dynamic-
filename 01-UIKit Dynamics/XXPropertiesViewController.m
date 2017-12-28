//
//  XXPropertiesViewController.m
//  01-UIKit Dynamics
//
//  Created by shine on 2017/12/19.
//  Copyright © 2017年 shine. All rights reserved.
//

#import "XXPropertiesViewController.h"

@interface XXPropertiesViewController ()

//ainmator
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (weak, nonatomic) IBOutlet UIImageView *dragonIV;
@property (weak, nonatomic) IBOutlet UIImageView *frogIV;

@end

@implementation XXPropertiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self startAnimator];
}

- (void)startAnimator {
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.animator = animator;
    
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.dragonIV, self.frogIV]];
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.dragonIV, self.frogIV]];
    collisionBehavior.collisionMode = UICollisionBehaviorModeBoundaries;
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    //只对青蛙图片设置元素属性，用龙图片进行对比
    UIDynamicItemBehavior *propertiesBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.frogIV]];
    propertiesBehavior.elasticity = 1.0f;
    propertiesBehavior.allowsRotation = NO;
    propertiesBehavior.angularResistance = 0.0f;
    propertiesBehavior.density = 3.0f;
    propertiesBehavior.friction = 0.5f;
    propertiesBehavior.resistance = 1.0f;
    
    [self.animator addBehavior:gravityBehavior];
    [self.animator addBehavior:collisionBehavior];
    [self.animator addBehavior:propertiesBehavior];
    
}

@end
