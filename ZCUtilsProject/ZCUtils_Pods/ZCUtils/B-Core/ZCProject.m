//
//  ZCProject.m
//  ZCUtils
//
//  Created by zjy on 2024/9/20.
//

#import "ZCProject.h"
#import "ZCService.h"
#import "ZCProxy.h"

@interface ZCProject () <ZCProxyComponentProtocol>

@end

@implementation ZCProject

+ (instancetype)sharedProject {
    static ZCProject *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ZCProject alloc] init];
    });
    return instance;
}

+ (BOOL)isLogin {
    return ZCProxy.proj.isLogin;
}

+ (BOOL)isUnlock {
    return ZCProxy.proj.isUnlock;
}

+ (NSString *)memberId {
    return ZCProxy.proj.memberId;
}

+ (NSString *)countryCode {
    return ZCProxy.proj.countryCode;
}

+ (NSString *)appBuildId {
    NSString *buildId = [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleVersion"];
    return [buildId isKindOfClass:NSString.class] ? buildId : @"0";
}

+ (NSString *)appVersion {
    NSString *version = [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return [version isKindOfClass:NSString.class] ? version : @"0.0.1";
}

#pragma mark - ZCProxyComponentProtocol
- (nullable NSBundle *)compResourceBundle {
    NSBundle *bul = [NSBundle bundleForClass:self.class];
    return [NSBundle bundleWithPath:[bul pathForResource:@"ZCUtils" ofType:@"bundle"]];
}

- (void)loginStatusChanged:(BOOL)isLogin {
    //TODO: xxxxx
}

@end
