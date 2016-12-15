//
//  UIViewController+SpringEx.m
//  SpringOC
//
//  Created by fuletian on 2016/12/15.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "UIViewController+SpringEx.h"

@implementation UIViewController (SpringEx)

+(UINavigationController * _Nonnull)sp_navigationControllerContain{
    
    id selfInstance = [[[self class] alloc] init];
    return [[UINavigationController alloc] initWithRootViewController:selfInstance];
}

@end
