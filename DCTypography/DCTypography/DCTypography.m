//
//  DCTypography.m
//  DCTypography
//
//  Created by Евгений Браницкий on 13.04.16.
//  Copyright © 2016 Akki. All rights reserved.
//

#import "DCTypography.h"



@interface DCTypography()
@property (strong, nonatomic, nonnull) NSMutableArray<DCTypographyStyle*> *styles;
@end

@implementation DCTypography

+ (instancetype)sharedInstance
{
    static DCTypography *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
        [instance setStyles:[NSMutableArray array]];
        
        DCTypographyStyle *defaultStyle = [DCTypographyStyle styleWithName:kDCTypographyDefaultStyleName];
        [instance.styles addObject:defaultStyle];
    });
    return instance;
}

+ (void)addStyle:(DCTypographyStyle *)style
{
    DCTypography *instance = [DCTypography sharedInstance];
    if ([instance styleWithName:style.name]) {
        [self removeStyleWithName:style.name];
    }
    [instance.styles addObject:style];
}

+ (void)removeStyle:(DCTypographyStyle *)style
{
    [[DCTypography sharedInstance].styles removeObject:style];
}

+ (void)removeStyleWithName:(NSString *)styleName
{
    DCTypographyStyle *style = [[DCTypography sharedInstance] styleWithName:styleName];
    [self removeStyle:style];
}

+ (NSAttributedString *)attributedStringWithContents:(NSString *)content styleName:(NSString *)styleName
{
    NSString *name = styleName;
    if (!name) {
        name = kDCTypographyDefaultStyleName;
    }
    DCTypographyStyle *style = [[DCTypography sharedInstance] styleWithName:name];
    NSAttributedString *result = [[NSAttributedString alloc] initWithString:content attributes:[style attributes]];
    
    return result;
}

- (DCTypographyStyle*)styleWithName:(NSString*)name
{
    return [self.styles filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"name == %@", name]].firstObject;
}

@end
