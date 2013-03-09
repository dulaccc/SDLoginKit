//
//  CustomOAuth2BackendViewController.h
//  SDLoginExample
//
//  Created by Pierre Dulac on 09/03/13.
//  Copyright (c) 2013 Bixby Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SDLoginViewControllerDelelgate;
@protocol SDSignUpViewControllerDelegate;
@protocol SDPasswordResetViewControllerDelegate;

@interface CustomOAuth2BackendViewController : UIViewController <SDLoginViewControllerDelelgate, SDSignUpViewControllerDelegate, SDPasswordResetViewControllerDelegate>

@end
