//
//  UIColor+Colors.m
//  cardalot
//
//  Created by Jason Noah Choi on 3/12/15.
//  Copyright (c) 2015 Jason Choi. All rights reserved.
//

#import "UIColor+Colors.h"

@implementation UIColor (Colors)

+ (UIColor *)customBlueColor {
    return [UIColor colorWithHue:204.0/360 saturation:.78 brightness:.66 alpha:1.0];
}

+ (UIColor *)customOrangeColor {
    return [UIColor colorWithHue:15.0/360 saturation:.83 brightness:1.0 alpha:1];
}

+ (UIColor *)customYellowColor {
    return [UIColor colorWithHue:44.0/360 saturation:.83 brightness:1.0 alpha:1];
}

+ (UIColor *)customGrayColor {
    return [UIColor colorWithRed:110.0/255 green:110.0/255 blue:110.0/255 alpha:1];
}

+ (UIColor *)backgroundGrayColor {
    return [UIColor colorWithHue:0.0 saturation:0.0 brightness:.91 alpha:1];
}
@end
