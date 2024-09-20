//
//  ZCProxy.h
//  LibTYTools
//
//  Created by zjy on 2023/10/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZCProxyProjectProtocol <NSObject>  /**< 主工程提供数据或数据处理 */

- (NSString *)memberId;

- (NSString *)countryCode;

- (BOOL)isLogin;

- (BOOL)isUnlock;

- (void)loginStatusChanged:(void(^)(BOOL isLogin))block;

@end



@protocol ZCProxyComponentProtocol <NSObject>  /**< 组件提供数据或数据处理 */

//TODO: 路由实现
//- (BOOL)router:(NSString *)sPath params:(NSDictionary *)params
//           nav:(UINavigationController *)nav;

- (nullable NSBundle *)compResourceBundle;

- (void)loginStatusChanged:(BOOL)isLogin;

@end



@interface ZCProxy : NSObject  /**< 和主工程交互类 */

+ (void)loadProj:(id <ZCProxyProjectProtocol>)proj;

+ (id <ZCProxyProjectProtocol>)proj;

+ (void)loadComp:(id <ZCProxyComponentProtocol>)comp;

+ (NSArray <id <ZCProxyComponentProtocol>>*)comps;

@end

NS_ASSUME_NONNULL_END
