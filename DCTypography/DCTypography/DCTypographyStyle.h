//
//  DCTypographyStyle.h
//  DCTypography
//
//  Created by Евгений Браницкий on 13.04.16.
//  Copyright © 2016 Akki. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#elif TARGET_OS_MAC
#import <Cocoa/Cocoa.h>
#endif

/**
 *  Name of default style
 */
FOUNDATION_EXTERN NSString * _Nonnull const kDCTypographyDefaultStyleName;

/**
 *  Class provides user-friendly interface for describing typographic style
 */
@interface DCTypographyStyle : NSObject

/**
 *  Unique style name
 */
@property (readonly, nonatomic, nonnull) NSString *name;

#if TARGET_OS_IPHONE
@property (strong, nonatomic, null_resettable) UIFont *font;
@property (strong, nonatomic, null_resettable) UIColor *foregroundColor;
@property (strong, nonatomic, null_resettable) UIColor *backgroundColor;
#elif TARGET_OS_MAC
@property (strong, nonatomic, null_resettable) NSFont *font;
@property (strong, nonatomic, null_resettable) NSColor *foregroundColor;
@property (strong, nonatomic, null_resettable) NSColor *backgroundColor;
#endif

/**
 *  Space between characters in string
 */
@property (readonly) CGFloat tracking;

/**
 *  Space between strings in case of multiline text
 */
@property (assign, nonatomic) CGFloat linespacing;
@property (assign, nonatomic) NSLineBreakMode lineBreakMode;
@property (assign, nonatomic) NSTextAlignment alignment;

/**
 *  You can provide your own NSParagraphStyle if you required something more complex
 */
@property (strong, nonatomic, nullable) NSParagraphStyle *customParagraphStyle;

/**
 *  Creates a new style object
 *
 *  @param name Unique style name
 *
 *  @return A new style object
 */
+ (nonnull instancetype)styleWithName:(nonnull NSString*)name;

/**
 *  Sets space between characters in string
 *
 *  @param tracking Space between characters in string
 *  @param ps       Use YES if you get a tracking value from the Adobe Photoshop;
 *                  it required for setting a correct value
 */
- (void)setTrackingValue:(CGFloat)tracking fromPhotoshop:(BOOL)ps;

/**
 *  Attributes which are ready-to-use for creating a new NSAttributeString
 *
 *  @return Attributes dictionary
 */
- (nonnull NSDictionary*)attributes;

/**
 *  Attributes which are ready-to-use for creating a new NSAttributeString
 *
 *  @param lineHeight Custom line height; allows to get line spacing less than 1.0
 *
 *  @return Attributes dictionary
 */
- (nonnull NSDictionary*)attributesForLineHeight:(CGFloat)lineHeight;
@end
