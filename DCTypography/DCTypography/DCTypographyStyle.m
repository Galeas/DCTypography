//
//  DCTypographyStyle.m
//  DCTypography
//
//  Created by Евгений Браницкий on 13.04.16.
//  Copyright © 2016 Akki. All rights reserved.
//

#import "DCTypographyStyle.h"

NSString * const kDCTypographyDefaultStyleName = @"kDCTypographyDefaultStyleName";

const CGFloat kUndefinedHeight = -1.0f;

@interface DCTypographyStyle ()
{
    @private
    CGFloat _linespacing;
    BOOL _customLinespacing;
}
@end

@implementation DCTypographyStyle

+ (instancetype)styleWithName:(NSString *)name
{
    DCTypographyStyle *style = [DCTypographyStyle new];
    style -> _name = name;
    return style;
}

- (void)setTrackingValue:(CGFloat)tracking fromPhotoshop:(BOOL)ps
{
    [self willChangeValueForKey:@"tracking"];
    if (ps) {
        self -> _tracking = self.font.pointSize * tracking / 1000.f;
    }
    else {
        self -> _tracking = tracking;
    }
    [self didChangeValueForKey:@"tracking"];
}

#if TARGET_OS_IPHONE

- (void)setFont:(UIFont *)font
{
    [self willChangeValueForKey:@"font"];
    if (!font) {
        self -> _font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    }
    else {
        self -> _font = font;
    }
    [self didChangeValueForKey:@"font"];
}

- (void)setForegroundColor:(UIColor *)foregroundColor
{
    [self willChangeValueForKey:@"foregroundColor"];
    if (!foregroundColor) {
        self -> _foregroundColor = [UIColor blackColor];
    }
    else {
        self -> _foregroundColor = foregroundColor;
    }
    [self didChangeValueForKey:@"foregroundColor"];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [self willChangeValueForKey:@"backgroundColor"];
    if (!backgroundColor) {
        self -> _backgroundColor = [UIColor clearColor];
    }
    else {
        self -> _backgroundColor = backgroundColor;
    }
    [self didChangeValueForKey:@"backgroundColor"];
}

#elif TARGET_OS_MAC
#endif

- (CGFloat)linespacing
{
    return _linespacing - self.font.lineHeight;
}

- (void)setLinespacing:(CGFloat)linespacing
{
    self -> _customLinespacing = YES;
    [self willChangeValueForKey:@"linespacing"];
    self -> _linespacing = linespacing;
    [self didChangeValueForKey:@"linespacing"];
}

- (NSParagraphStyle*)paragraphStyle:(CGFloat)height
{
    if (self.customParagraphStyle) {
        return self.customParagraphStyle;
    }
    else {
        NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
        if ([self.name isEqualToString:kDCTypographyDefaultStyleName]) {
            return style;
        }
        if (self -> _customLinespacing) {
            [style setLineSpacing:self -> _linespacing];
        }
        
        if (height != kUndefinedHeight) {
            UIFont *font = self.font;
            if (!font) {
                font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
            }
            CGFloat heightMultiple = height / font.lineHeight;
            [style setLineHeightMultiple:heightMultiple];
        }
        
        [style setLineBreakMode:self.lineBreakMode];
        [style setAlignment:self.alignment];
        return style;
    }
}

- (NSDictionary *)attributes
{
    return [self attributesForLineHeight:kUndefinedHeight];
}

- (NSDictionary*)attributesForLineHeight:(CGFloat)lineHeight
{
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    BOOL defaultStyle = [self.name isEqualToString:kDCTypographyDefaultStyleName];
    
    UIFont *font = self.font;
    if (!font || defaultStyle) {
        font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    }
    attributes[NSFontAttributeName] = font;
    
    UIColor *foreground = self.foregroundColor;
    if (!foreground || defaultStyle) {
        foreground = [UIColor blackColor];
    }
    attributes[NSForegroundColorAttributeName] = foreground;
    
    UIColor *background = self.backgroundColor;
    if (!background || defaultStyle) {
        background = [UIColor clearColor];
    }
    attributes[NSBackgroundColorAttributeName] = background;
    
    attributes[NSParagraphStyleAttributeName] = [self paragraphStyle:lineHeight];
    attributes[NSKernAttributeName] = @(self.tracking);
    
    return attributes;
}

@end
