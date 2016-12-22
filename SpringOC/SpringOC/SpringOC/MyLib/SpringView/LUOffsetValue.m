//
//  LUOffsetValue.m
//  SpringOC
//
//  Created by fuletian on 2016/12/22.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "LUOffsetValue.h"

@implementation LUOffsetValue

-(id _Nonnull)initWithJSON:(NSString *_Nonnull)json{
    self = [super init];
    if(self){
        
        NSDictionary *dic = [[self class] dictionaryWithJsonString:[NSString stringWithFormat:@"{%@}",json]];
        
        NSArray<NSString *> *allKeys = dic.allKeys;
        if(allKeys.count == 1 ){
            self.offsetToIndexId = allKeys.firstObject;
            
            NSDictionary *config = dic[self.offsetToIndexId];
            
            self.leftPx = config[@"left"];
            self.topPx = config[@"top"];
            self.bottomPx = config[@"bottom"];
            self.rightPx = config[@"right"];
        }
    }
    
    return self;
}

/*!
 
 * @brief 把格式化的JSON格式的字符串转换成字典
 
 * @param jsonString JSON格式的字符串
 
 * @return 返回字典
 
 */

+(NSDictionary * _Nullable)dictionaryWithJsonString:(NSString * _Nonnull)jsonString {
    
    if (jsonString == nil) {
        
        return nil;
        
    }
    
    if([jsonString containsString:@"\""] == false){
        
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"super" withString:@"\"super\""];
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"top" withString:@"\"top\""];
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"left" withString:@"\"left\""];
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"bottom" withString:@"\"bottom\""];
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"right" withString:@"\"right\""];
        
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
    
    if(err) {
        
        NSLog(@"json解析失败：%@",err);
        
        return nil;
        
    }
    
    return dic;
    
}

@end
