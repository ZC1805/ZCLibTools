//
//  ZCCacheProvider.m
//  LibTYTools
//
//  Created by zjy on 2023/10/30.
//

#import "ZCCacheProvider.h"
#import "NSDictionary+ZC.h"

@interface ZCCacheProvider ()

@property (null_resettable, nonatomic, strong) NSDictionary *cacheInfo;

@property (null_resettable, nonatomic, strong) NSDictionary *fixedInfo;

@end

@implementation ZCCacheProvider

@synthesize cacheInfo = _cacheInfo, fixedInfo = _fixedInfo;

#pragma mark - Set & Get
- (NSDictionary *)cacheInfo {
    ZCServiceSetGetFuncKey
    _cacheInfo = [self archiveDictionary:nil forKey:func_key lastCacheData:_cacheInfo];
    return _cacheInfo;
}

- (void)setCacheInfo:(NSDictionary *)cacheInfo {
    ZCServiceSetGetFuncKey
    [self archiveDictionary:cacheInfo forKey:func_key lastCacheData:_cacheInfo];
    _cacheInfo = cacheInfo;
}

- (NSDictionary *)fixedInfo {
    ZCServiceSetGetFuncKey
    _fixedInfo = [self archiveIgnoreVersionDic:nil forKey:func_key lastCacheData:_fixedInfo];
    return _fixedInfo;
}

- (void)setFixedInfo:(NSDictionary *)fixedInfo {
    ZCServiceSetGetFuncKey
    [self archiveIgnoreVersionDic:fixedInfo forKey:func_key lastCacheData:_fixedInfo];
    _fixedInfo = fixedInfo;
}

#pragma mark - Api1
- (void)setCache_status_bar_hei:(CGFloat)cache_status_bar_hei {
    ZCServiceSetGetFuncKey
    NSNumber *num = [NSNumber numberWithFloat:cache_status_bar_hei];
    self.fixedInfo = [self.fixedInfo replaceForNewObject:num forKey:func_key];
}

- (CGFloat)cache_status_bar_hei {
    ZCServiceSetGetFuncKey
    return [self.fixedInfo floatValueForKey:func_key];
}

@end
