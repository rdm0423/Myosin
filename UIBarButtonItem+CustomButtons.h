//
//  UIBarButtonItem+CustomButtons.h
//  cardalot
//
//  Created by Jason Noah Choi on 3/12/15.
//  Copyright (c) 2015 Jason Choi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CustomButtons)

+ (UIBarButtonItem *)studyButtonWithImage:(UIImage *)image target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)quizButtonWithImage:(UIImage *)image target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)backButtonWithImage:(UIImage *)image target:(id)target action:(SEL)action;

@end
