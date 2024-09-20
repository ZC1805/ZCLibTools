//
//  ZCGlobal.m
//  ZCKit
//
//  Created by admin on 2018/9/18.
//  Copyright © 2018 Squat in house. All rights reserved.
//

#import "ZCGlobal.h"
#import "ZCProxy.h"
#import "ZCKitBridge.h"
#import "ZCCacheProvider.h"
#import "ZCViewController.h"

@interface ZCGlobal ()

@property (nonatomic, assign) CGFloat sWid; //宽

@property (nonatomic, assign) CGFloat sHei; //高

@property (nonatomic, assign) CGFloat radio; //比例

@property (nonatomic, assign) BOOL isFullScreen; //全面屏

@property (nonatomic, copy) NSString *imgSuf3; //exp@3x

@property (nonatomic, copy) NSString *imgSuf2; //exp@2x

@property (nonatomic, assign) CGFloat statusBarHei; //状态栏高

@end

@implementation ZCGlobal

+ (instancetype)sharedGlobal {
    static ZCGlobal *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ZCGlobal alloc] init];
        CGFloat wid = [UIScreen mainScreen].bounds.size.width;
        CGFloat hei = [UIScreen mainScreen].bounds.size.height;
        instance.radio = -1;
        instance.sWid = MIN(hei, wid);
        instance.sHei = MAX(hei, wid);
        instance.isFullScreen = (instance.sHei / instance.sWid) >= 2.0;
        instance.imgSuf3 = [NSString stringWithFormat:@"@%dx", (int)[UIScreen mainScreen].scale];
        instance.imgSuf2 = [NSString stringWithFormat:@"@%dx", (int)([UIScreen mainScreen].scale - 1)];
    });
    return instance;
}

#pragma mark - InstanceFunc
- (CGFloat)obtainStatusBarHei {
    if (self.statusBarHei < 1.0) {
        CGFloat sHei = ZCCacheProvider.sharedService.cache_status_bar_hei;
        if (sHei < 1.0) {
            if (@available(iOS 13.0, *)) {
                UIScene *anyScene = [UIApplication sharedApplication].connectedScenes.anyObject;
                if ([anyScene isKindOfClass:UIWindowScene.class]) {
                    sHei = ((UIWindowScene *)anyScene).statusBarManager.statusBarFrame.size.height;
                    if (sHei > 1.0) { ZCCacheProvider.sharedService.cache_status_bar_hei = sHei; }
                }
            }
        }
        if (sHei < 1.0) {
            sHei = [UIApplication sharedApplication].statusBarFrame.size.height;
            if (sHei > 1.0) { ZCCacheProvider.sharedService.cache_status_bar_hei = sHei; }
        }
        self.statusBarHei = sHei;
    }
    CGFloat finalHei = self.statusBarHei;
    if (finalHei < 1.0) {
        BOOL isHaveIslan = NO;
        if (@available(iOS 16.0, *)) {
            isHaveIslan = [UIApplication sharedApplication].delegate.window.safeAreaInsets.top >= 51;
        }
        finalHei = self.isFullScreen ? (isHaveIslan ? 59.0 : 47.0) : 20.0;
    }
    return finalHei;
}

#pragma mark - Misc1
+ (CGFloat)ratio {
    ZCGlobal *instance = [ZCGlobal sharedGlobal];
    if (instance.radio < 0) {
        if (ZCKitBridge.screenFixMaxWidth <= 0) {
            instance.radio = 1.0;
        } else {
            instance.radio = instance.sWid / ZCKitBridge.screenFixMaxWidth;
        }
    }
    return instance.radio;
}

+ (CGFloat)roundScreenPointsForUIPoints:(CGFloat)uiPoints {
    if (uiPoints > -0.00001 && uiPoints < 0.00001) {
        return 0.0;
    }
    if (uiPoints > -0.03 && uiPoints < 0.03) {
        return self.minScreenPoints;
    }
    return roundf(uiPoints * [ZCGlobal sharedGlobal].sWid / ZCKitBridge.screenFixMaxWidth);
}

+ (CGFloat)ceilScreenPointsForUIPoints:(CGFloat)uiPoints {
    static float screen_uiPoints = 360.0;
    if (uiPoints > -0.00001 && uiPoints < 0.00001) {
        return 0.0;
    }
    if (uiPoints > -0.03 && uiPoints < 0.03) {
        return self.minScreenPoints;
    }
    return ceilf(uiPoints * [ZCGlobal sharedGlobal].sWid / ZCKitBridge.screenFixMaxWidth);
}

+ (CGFloat)minScreenPoints {
    static float min_screenPoints = 0.01;
    return min_screenPoints;
}

+ (CGFloat)obtainDeviceStatusBarHei {
    return [[ZCGlobal sharedGlobal] obtainStatusBarHei];
}

+ (BOOL)isiPhoneX {
    return [ZCGlobal sharedGlobal].isFullScreen;
}

+ (BOOL)isLandscape {
    return ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeLeft ||
            [UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeRight);
}

+ (BOOL)isValidStr:(NSString *)str {
    if (str && [str isKindOfClass:NSString.class] && str.length) {
        if (![str isEqualToString:@"<null>"] && ![str isEqualToString:@"(null)"] &&
            [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length) {
            return YES;
        }
    }
    return NO;
}

+ (BOOL)isExplicitArr:(nullable NSArray *)array elementClass:(Class)elementClass {
    BOOL isExplicitElement = YES;
    if (array && [array isKindOfClass:NSArray.class]) {
        if (elementClass) {
            for (id element in array) {
                if (![element isKindOfClass:elementClass]) { isExplicitElement = NO; break; }
            }
        }
    } else {
        isExplicitElement = NO;
    }
    return isExplicitElement;
}

#pragma mark - Misc2
+ (nullable UIImage *)imageForName:(nullable NSString *)name {
    if (!name.length) return nil;
    UIImage *image = [UIImage imageNamed:name];
    if (!image) {
        for (id <ZCProxyComponentProtocol>comp in ZCProxy.comps) {
            NSBundle *bundle = comp.compResourceBundle;
            if (bundle) {
                image = [UIImage imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
                if (image) break;
            }
        }
    } return image;
}

+ (nullable NSString *)resourcePath:(nullable NSString *)name ext:(nullable NSString *)ext {
    if (!name.length) return nil;
    NSBundle *mBundle = [NSBundle mainBundle];
    NSString *link = [self resource:mBundle name:name ext:ext];
    if (!link.length) {
        for (id <ZCProxyComponentProtocol>comp in ZCProxy.comps) {
            NSBundle *cBundle = comp.compResourceBundle;
            if (cBundle) {
                link = [self resource:cBundle name:name ext:ext];
                if (link.length) break;
            }
        }
    } return link;
}

+ (nullable NSString *)resource:(NSBundle *)bdl name:(nullable NSString *)name ext:(nullable NSString *)ext {
    if (!bdl || !name.length) return nil;
    NSString *link = [bdl pathForResource:name ofType:ext];
    if (!link.length) {
        link = [bdl pathForResource:[name stringByAppendingString:[ZCGlobal sharedGlobal].imgSuf3] ofType:ext];
    }
    if (!link.length) {
        link = [bdl pathForResource:[name stringByAppendingString:[ZCGlobal sharedGlobal].imgSuf2] ofType:ext];
    }
    return link;
}

#pragma mark - Misc3
+ (UIViewController *)rootController {
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    if (!window || window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [UIApplication sharedApplication].windows;
        for (long i = windows.count - 1; i >= 0; i --) {
            if ([windows[i] windowLevel] == UIWindowLevelNormal) {
                window = windows[i]; break;
            }
        }
        if (!window) window = windows.lastObject;
    }
    if (window && window.rootViewController) {
        id controller = [window.subviews.firstObject nextResponder];
        if (controller && [controller isKindOfClass:UIViewController.class]) {
            return controller;
        } else {
            return window.rootViewController;
        }
    } else {
        NSAssert(0, @"ZCKit: window is no normal level");
        return nil;
    }
}

+ (UIViewController *)findTopController:(UIViewController *)rootvc {
    if (!rootvc) { rootvc = [UIApplication sharedApplication].delegate.window.rootViewController; }
    if (!rootvc) { return nil; }
    UIViewController *psvc = rootvc.presentedViewController;
    if (psvc && psvc.view.window) {
        CGFloat min_wid = [UIScreen mainScreen].bounds.size.width - 2;
        CGFloat min_hei = [UIScreen mainScreen].bounds.size.height - 2;
        if (psvc.view.frame.size.width > min_wid && psvc.view.frame.size.height > min_hei) {
            return [self findTopController:psvc];
        }
    }
    if ([rootvc isKindOfClass:UITabBarController.class]) {
        if ([(UITabBarController *)rootvc selectedViewController]) {
            return [self findTopController:[(UITabBarController *)rootvc selectedViewController]];
        }
    } else if ([rootvc isKindOfClass:UINavigationController.class]) {
        if ([(UINavigationController *)rootvc topViewController]) {
            return [self findTopController:[(UINavigationController *)rootvc topViewController]];
        }
    } else if ([rootvc isKindOfClass:UISplitViewController.class]) {
        if ([(UISplitViewController *)rootvc viewControllers].count) {
            return [self findTopController:[(UISplitViewController *)rootvc viewControllers].lastObject];
        }
    } else if (rootvc.childViewControllers.count && 
               [rootvc respondsToSelector:@selector(visibleChildViewController)]) {
        if ([(id<ZCViewControllerPrivateProtocol>)rootvc visibleChildViewController]) {
            return [self findTopController:[(id<ZCViewControllerPrivateProtocol>)rootvc visibleChildViewController]];
        }
    }
    return rootvc;
}

+ (UIViewController *)topController {
    return [self findTopController:[self rootController]];
}

+ (nullable ZCViewController *)lastZCVC:(UIViewController *)rootVC {
    if (!rootVC) { rootVC = [UIApplication sharedApplication].delegate.window.rootViewController; }
    if (!rootVC) { return nil; }
    NSMutableArray *list = [NSMutableArray array];
    [self linkedRootList:list root:rootVC];
    UIViewController *finalVC = nil;
    CGFloat min_wid = [UIScreen mainScreen].bounds.size.width - 2;
    CGFloat min_hei = [UIScreen mainScreen].bounds.size.height - 2;
    for (UIViewController *itemVC in list.reverseObjectEnumerator) {
        if ([itemVC isKindOfClass:ZCViewController.class] &&
            itemVC.view.frame.size.height > min_hei &&
            itemVC.view.frame.size.width > min_wid) {
            finalVC = itemVC; break;
        }
    }
    return (ZCViewController *)finalVC;
}

+ (void)linkedRootList:(NSMutableArray <UIViewController *>*)list root:(UIViewController *)rootVC {
    [self linkedCheckList:list check:rootVC];
    UIViewController *presentVC = list.lastObject.presentedViewController;
    if (presentVC) { [self linkedRootList:list root:presentVC]; }
}

+ (void)linkedCheckList:(NSMutableArray <UIViewController *>*)list check:(UIViewController *)checkVC {
    if (!checkVC || !list) return;
    [list addObject:checkVC];
    if ([checkVC isKindOfClass:UITabBarController.class]) {
        [self linkedCheckList:list check:((UITabBarController *)checkVC).selectedViewController];
    } else if ([checkVC isKindOfClass:UINavigationController.class]) {
        for (UIViewController *itemVC in ((UINavigationController *)checkVC).viewControllers) {
            [self linkedCheckList:list check:itemVC];
        }
    } else if ([checkVC isKindOfClass:UISplitViewController.class]) {
        for (UIViewController *itemVC in ((UISplitViewController *)checkVC).viewControllers) {
            [self linkedCheckList:list check:itemVC];
        }
    } else if (checkVC.childViewControllers.count &&
               [checkVC respondsToSelector:@selector(visibleChildViewController)]) {
        UIViewController *visVC = [(id<ZCViewControllerPrivateProtocol>)checkVC visibleChildViewController];
        if (visVC) { [self linkedCheckList:list check:visVC]; }
    }
}

+ (nullable ZCViewController *)lastZCController {
    return [self lastZCVC:[self rootController]];
}

@end
