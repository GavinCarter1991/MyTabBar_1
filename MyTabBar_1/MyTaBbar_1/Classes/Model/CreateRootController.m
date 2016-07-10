//
//  CreateRootController.m
//  MyTaBbar_1
//
//  Created by Gavin on 16/7/10.
//  Copyright © 2016年 gavin. All rights reserved.
//

#import "CreateRootController.h"

@implementation CreateRootController

// 修改系统TabbarItem图片、文字颜色
- (NSMutableArray *)setUpController {
    NSArray *vcName = @[@"MainViewController",@"SearchViewController",@"MessageViewController",@"PersonCenterViewController"];
    // 配置item
    NSArray *normalImage = @[@"tabbar_home",@"tabbar_discover",@"tabbar_message_center",@"tabbar_profile"];
    NSArray *seletedImage = @[@"tabbar_home_selected",@"tabbar_discover_selected",@"tabbar_message_center_selected",@"tabbar_profile_selected"];
    NSArray *titleArray = @[@"首页",@"搜索",@"信息",@"我"];
    //临时vc数组
    NSMutableArray *viewControllers = [NSMutableArray array];
    for (int i = 0; i < [vcName count]; i ++) {
        // 1 获取Class
        Class class = NSClassFromString(vcName[i]);
        // 2 创建对象
        UIViewController *VC = [[class alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:VC];
        VC.title = titleArray[i];
        // 3 创建tabbar
        [self controller:nav Title:titleArray[i] tabBarItemImage:normalImage[i] tabBarItemSelectedImage:seletedImage[i]];
        [viewControllers addObject:nav];
        [self navigationBarColor];
    }
    return viewControllers;
}
// 创建tabbar
- (void)controller:(UIViewController *)controller Title:(NSString *)title tabBarItemImage:(NSString *)image tabBarItemSelectedImage:(NSString *)selectedImage {
    controller.title = title;
    controller.tabBarItem.image = [UIImage imageNamed:image];
    // 设置 tabbarItem 选中状态的图片(不被系统默认渲染,显示图像原始颜色)
    UIImage *imageHome = [UIImage imageNamed:selectedImage];
    imageHome = [imageHome imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [controller.tabBarItem setSelectedImage:imageHome];
    // 设置 tabbarItem 选中状态下的文字颜色(不被系统默认渲染,显示文字自定义颜色)
    NSDictionary *dictHome = [NSDictionary dictionaryWithObject:[UIColor orangeColor] forKey:NSForegroundColorAttributeName];
    [controller.tabBarItem setTitleTextAttributes:dictHome forState:UIControlStateSelected];
}
// 导航栏颜色
- (void)navigationBarColor {
    // 导航栏颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.0938 green:1.0 blue:0.7831 alpha:1.0]];
    // 设置渲染颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    // 导航栏的字体颜色
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

@end
