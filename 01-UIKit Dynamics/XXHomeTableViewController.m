//
//  XXHomeTableViewController.m
//  01-UIKit Dynamics
//
//  Created by shine on 2017/12/19.
//  Copyright © 2017年 shine. All rights reserved.
//

#import "XXHomeTableViewController.h"

#import "XXGravityViewController.h"
#import "XXCollisionsViewController.h"
#import "XXAttatchmentsViewController.h"
#import "XXSpringsViewController.h"
#import "XXSnapViewController.h"
#import "XXForcesViewController.h"
#import "XXPropertiesViewController.h"

@interface XXHomeTableViewController ()

@end

@implementation XXHomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //
    //1.重力  2.碰撞  3.附着  4.弹跳效果  5.瞬间位移  6.推力效果  7.元素属性
    UIViewController *vc = nil;
    switch (indexPath.row) {
        case 0:
            vc = [[XXGravityViewController alloc] init];
            break;
            
        case 1:
            vc = [[XXCollisionsViewController alloc] init];
            break;
            
        case 2:
            vc = [[XXAttatchmentsViewController alloc] init];
            break;
            
        case 3:
            vc = [[XXSpringsViewController alloc] init];
            break;
            
        case 4:
            vc = [[XXSnapViewController alloc] init];
            break;
            
        case 5:
            vc = [[XXForcesViewController alloc] init];
            break;
        case 6:
            vc = [[XXPropertiesViewController alloc] init];
            break;
            
        case 7:
            vc = [[XXGravityViewController alloc] init];
            break;
            
            
        default:
            break;
    }
    
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
