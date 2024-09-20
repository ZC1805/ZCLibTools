//
//  ZCService.h
//  ZCKit
//
//  Created by admin on 2019/1/22.
//  Copyright © 2019 Squat in house. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+ZC.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ZCServiceProtocol <NSObject>  /**< 回调时子类可用的方法 */

@optional

- (void)serviceInit;  /**< 初始化回调 */

- (void)serviceCleanData;  /**< 销毁回调 */

- (void)serviceEnterBackground;  /**< 状态回调 */

- (void)serviceEnterForeground;  /**< 状态回调 */

@end



@interface ZCServiceHandler: NSObject  /**< 单例基类，可设置启动和销毁 */

+ (void)fire;  /**< 启动单例管理类，在程序启用的时候调用，只需调用1次 */

+ (void)destoryService;  /**< 销毁单例类，将清除所有继承于ZCService的对象 */

@end



@interface ZCService : NSObject <ZCServiceProtocol>  /**< 通用单例类，可供子类继承 */

@property (nonatomic, copy, readonly) NSString *kJsonDocPath;  /**< 拿不到路径返回@"" */

- (NSDictionary *)archiveDictionary:(nullable NSDictionary *)data 
                             forKey:(NSString *)key
                      lastCacheData:(nullable NSDictionary *)lastCacheData;  /**< data传nil就是取值 */

- (NSDictionary *)archiveIgnoreVersionDic:(nullable NSDictionary *)data 
                                   forKey:(NSString *)key
                            lastCacheData:(nullable NSDictionary *)lastCacheData;  /**< data传nil就是取值 */

- (NSDictionary *)archiveIgnoreVersionAndMemberDic:(nullable NSDictionary *)data 
                                            forKey:(NSString *)key
                                     lastCacheData:(nullable NSDictionary *)lastCacheData;  /**< data传nil就是取值 */

- (void)start;  /**< 空方法&调用可以让对象提前初始化 */

+ (instancetype)sharedService;  /**< 单例初始化方法 */

@end



#ifndef ZCServiceSetGetFuncKey
#define ZCServiceSetGetFuncKey \
    NSString *k_key = nil;\
    NSString *cs = NSStringFromClass(self.class);\
    NSString *fs = [NSString stringWithCString:sel_getName(_cmd) encoding:kCFStringEncodingUTF8];\
    if (cs.length > 0 && fs.length > 4 && [fs hasPrefix:@"set"]) {\
        NSString *gs = [fs substringFromIndex:3];\
        NSString *header_s = [gs substringToIndex:1];\
        NSString *footer_s = [gs substringFromIndex:1];\
        if ([header_s isEqualToString:header_s.uppercaseString]) {\
            gs = [header_s.lowercaseString stringByAppendingString:footer_s];\
            gs = [gs replaceCharStrings:@":" withString:@"" reverse:NO];\
            if ([self respondsToSelector:NSSelectorFromString(gs)]) {\
                k_key = [NSString stringWithFormat:@"%@_%@", cs, gs];\
            }\
        }\
    } else if (cs.length > 0 && fs.length > 1) {\
        k_key = [NSString stringWithFormat:@"%@_%@", cs, fs];\
    }\
    if (!k_key) {\
        NSAssert(0, @"check key!");\
        k_key = [NSString stringWithFormat:@"%@_%@", cs, fs];\
    }\
    NSString *func_key = k_key.copy;
#endif

NS_ASSUME_NONNULL_END
