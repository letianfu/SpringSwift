//
//  LUOffsetValue.m
//  SpringOC
//
//  Created by fuletian on 2016/12/22.
//  Copyright © 2016年 letian. All rights reserved.
//

#import "SpringLayoutOffsetValue.h"

@implementation SpringLayoutSlideValue

-(id)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if(self){
        
        self.indexId = dic[@"id"];
        self.equal = [dic[@"equal"] floatValue];
        
        NSAssert(self.indexId, @"");
    }
    
    return self;
}

@end

@implementation SpringLayoutOffsetValue

-(id _Nonnull)initWithJSON:(NSString *_Nonnull)json{
    self = [super init];
    if(self){
        
        NSDictionary *dic = [[self class] dictionaryWithJsonString:[NSString stringWithFormat:@"{%@}",json]];
        
        NSAssert(dic, @"%@",json);
        
        NSDictionary *left = dic[@"left"];
        if(left){
            self.left = [[SpringLayoutSlideValue alloc] initWithDictionary:left];
        }
        
        NSDictionary *right = dic[@"right"];
        if(right){
            self.right = [[SpringLayoutSlideValue alloc] initWithDictionary:right];
        }
        
        NSDictionary *top = dic[@"top"];
        if(top){
            self.top = [[SpringLayoutSlideValue alloc] initWithDictionary:top];
        }
        
        NSDictionary *bottom = dic[@"bottom"];
        if(right){
            self.bottom = [[SpringLayoutSlideValue alloc] initWithDictionary:bottom];
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
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"id" withString:@"\"id\""];
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"equal" withString:@"\"equal\""];
        
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
    
    if(err) {
        
        NSLog(@"json解析失败：%@",err);
        NSAssert(NO, @"%@",jsonString);
        
        return nil;
        
    }
    
    return dic;
    
}

@end
