//
//  UIBarButtonItem+CustomButtons.m
//  cardalot
//
//  Created by Jason Noah Choi on 3/12/15.
//  Copyright (c) 2015 Jason Choi. All rights reserved.
//

#import "UIBarButtonItem+CustomButtons.h"
#import "UIColor+Colors.h"

@implementation UIBarButtonItem (CustomButtons)

+ (UIBarButtonItem *)studyButtonWithImage:(UIImage *)image target:(id)target action:(SEL)action {
    UIImage *studyIconYellow = [UIImage imageNamed:@"Syellowicon"];
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [aButton setImage:studyIconYellow forState:UIControlStateNormal];
    [aButton setFrame:CGRectMake(0, 0, studyIconYellow.size.width, studyIconYellow.size.height)];
    [aButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithCustomView:aButton];
    
    return button;
}

+ (UIBarButtonItem *)quizButtonWithImage:(UIImage *)image target:(id)target action:(SEL)action {
     UIImage *quizIconOrange = [UIImage imageNamed:@"Qorangeicon"];
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [aButton setImage:quizIconOrange forState:UIControlStateNormal];
    [aButton setFrame:CGRectMake(0, 0, quizIconOrange.size.width, quizIconOrange.size.height)];
    [aButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithCustomView:aButton];
//    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithImage:quizIconOrange style:UIBarButtonItemStylePlain target:self action:@selector(buttons)];
//    [button setTintColor:[UIColor customGrayColor]];
    return button;
}
+ (UIBarButtonItem *)backButtonWithImage:(UIImage *)image target:(id)target action:(SEL)action {
    UIImage *backIcon = [UIImage imageNamed:@"backbutton"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:backIcon forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0, 0, backIcon.size.width, backIcon.size.height)];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    return backButton;
}

- (void)buttons {
    NSLog(@"Custom button pressed");
}

@end
