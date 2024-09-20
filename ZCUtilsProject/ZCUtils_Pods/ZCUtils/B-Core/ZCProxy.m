//
//  ZCProxy.m
//  LibTYTools
//
//  Created by zjy on 2023/10/30.
//

#import "ZCProxy.h"
#import "ZCProject.h"
#import "ZCService.h"

@interface ZCProxy ()

@property (nonatomic, strong) id <ZCProxyProjectProtocol> proj;

@property (nonatomic, strong) NSMutableArray <id <ZCProxyComponentProtocol>>* comps;

@end

@implementation ZCProxy

+ (instancetype)sharedProxy {
    static ZCProxy *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ZCProxy alloc] init];
        instance.comps = [NSMutableArray array];
        [instance initProxyFinish];
    }); return instance;
}

+ (void)loadProj:(id <ZCProxyProjectProtocol>)proj {
    [ZCProxy sharedProxy].proj = proj;
    [[ZCProxy sharedProxy] loadProjFinish];
}

+ (id <ZCProxyProjectProtocol>)proj {
    NSAssert([ZCProxy sharedProxy].proj, @"ZCKit: proxy is nil");
    return [ZCProxy sharedProxy].proj;
}

+ (void)loadComp:(id <ZCProxyComponentProtocol>)comp {
    if (comp && [comp conformsToProtocol:@protocol(ZCProxyComponentProtocol)]) {
        [[ZCProxy sharedProxy].comps addObject:comp];
    }
    [[ZCProxy sharedProxy] loadNewComp];
}

+ (NSArray <id <ZCProxyComponentProtocol>>*)comps {
    return [ZCProxy sharedProxy].comps;
}

#pragma mark - Auto
- (void)initProxyFinish {
    [ZCServiceHandler fire];
    [self.comps addObject:(id <ZCProxyComponentProtocol>)[ZCProject sharedProject]];
}

- (void)loadProjFinish {
    __weak typeof(self) wself = self;
    [self.proj loginStatusChanged:^(BOOL isLogin) {
        [ZCServiceHandler destoryService];
        for (id <ZCProxyComponentProtocol>comp in ZCProxy.comps) {
            [comp loginStatusChanged:isLogin];
        }
    }];
    //TODO: xx
}

- (void)loadNewComp {
    //TODO: xx
}

@end
