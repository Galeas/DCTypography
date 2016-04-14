//
//  DCTypography.h
//  DCTypography
//
//  Created by Евгений Браницкий on 13.04.16.
//  Copyright © 2016 Akki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCTypographyStyle.h"

@interface DCTypography : NSObject

/**
 *  Adds a new style to the storage; replaces old style with the same name
 *
 *  @param style A new style object
 */
+ (void)addStyle:(nonnull DCTypographyStyle*)style;

/**
 *  Removes specified style from the storage
 *
 *  @param style Style to be removed
 */
+ (void)removeStyle:(nonnull DCTypographyStyle*)style;

/**
 *  Removes a style with specified name from the storage
 *
 *  @param styleName Name of style to be removed
 */
+ (void)removeStyleWithName:(nonnull NSString*)styleName;

/**
 *  Creates a new NSAttributedString with attributes described in style with specified name
 *
 *  @param content   NSAttributedString content string
 *  @param styleName Name of style
 *
 *  @return A new NSAttributedString instance
 */
+ (nonnull NSAttributedString*)attributedStringWithContents:(nonnull NSString*)content styleName:(nullable NSString*)styleName;

@end
