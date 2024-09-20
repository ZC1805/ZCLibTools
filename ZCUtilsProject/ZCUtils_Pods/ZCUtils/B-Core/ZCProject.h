//
//  ZCProject.h
//  ZCUtils
//
//  Created by zjy on 2024/9/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZCProject : NSObject  /**< 上层数据提供类 */

@property (class, nonatomic, assign, readonly) BOOL isLogin;

@property (class, nonatomic, assign, readonly) BOOL isUnlock;

@property (class, nonatomic, copy, readonly) NSString *memberId;

@property (class, nonatomic, copy, readonly) NSString *countryCode;

@property (class, nonatomic, copy, readonly) NSString *appBuildId;

@property (class, nonatomic, copy, readonly) NSString *appVersion;

+ (instancetype)sharedProject;

@end

NS_ASSUME_NONNULL_END
