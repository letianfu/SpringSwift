//
//  UIColor+SpringEx.m
//  SpringOC
//
//  Created by fuletian on 2016/12/22.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "UIColor+SpringEx.h"

@implementation UIColor (SpringEx)

+(UIColor * _Nullable)sp_rgb:(NSString * _Nullable)source{
    
    if(source.length){
        NSArray *rgb = [source componentsSeparatedByString:@","];
        float r = [rgb[0] floatValue];
        float g = [rgb[1] floatValue];
        float b = [rgb[2] floatValue];
        
        float a = 1;
        if(rgb.count > 3){
            a = [rgb[3] floatValue];
        }
        
        return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a];
    }
    
    return nil;
}

@end
