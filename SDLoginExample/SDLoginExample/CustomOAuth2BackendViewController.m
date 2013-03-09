//
//  CustomOAuth2BackendViewController.m
//  SDLoginExample
//
//  Created by Pierre Dulac on 09/03/13.
//  Copyright (c) 2013 Bixby Apps. All rights reserved.
//

#import "CustomOAuth2BackendViewController.h"

#import "SDLoginViewController.h"

#import "AFNetworking.h"
#import "AFOAuth2Client.h"

@interface CustomOAuth2BackendViewController ()

+ (AFOAuth2Client *)sharedOAuthClient;

@end

@implementation CustomOAuth2BackendViewController

+ (AFOAuth2Client *)sharedOAuthClient
{
    static AFOAuth2Client *_sharedOAuthClient = nil;
    static dispatch_once_t secondToken;
    dispatch_once(&secondToken, ^{
        _sharedOAuthClient = [[AFOAuth2Client alloc] initWithBaseURL:[NSURL URLWithString:@"http://example.com/api/"]
                                                            clientID:@"CLIENT_ID"
                                                   secret:@"CLIENT_SECRET"];
    });
    
    return _sharedOAuthClient;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //Load login panel
    SDLoginViewController *loginViewController = [[SDLoginViewController alloc] init];
    loginViewController.delegate = self;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [self presentViewController:navController animated:YES completion:nil];
}


#pragma mark - SDLoginViewController delegate

- (void)loginViewController:(SDLoginViewController *)loginViewController authenticateWithCredential:(NSURLCredential *)credential
{
    [[CustomOAuth2BackendViewController sharedOAuthClient] authenticateUsingOAuthWithPath:@"/oauth2/access_token/"
         username:credential.user
         password:credential.password
            scope:nil
          success:^(AFOAuthCredential *oAuth2Credentials){
              NSLog(@"I have a token! %@", oAuth2Credentials.accessToken);
              
              // store the credentials
              [AFOAuthCredential storeCredential:oAuth2Credentials
                                  withIdentifier:[CustomOAuth2BackendViewController sharedOAuthClient].serviceProviderIdentifier];
              
          }
          failure:^(NSError *error){
              NSLog(@"Error: %@", error);
              
              // TODO handle "invalid_grant" which is wrong username & password couple
              //if (error.code == 400 && error.userInfo.)
              
              // TODO handle refresh the token
              // ...
          }];
}

@end
