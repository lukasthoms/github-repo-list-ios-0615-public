//
//  FISGithubAPIClient.m
//  github-repo-list
//
//  Created by Tom OMalley on 7/6/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "FISGithubAPIClient.h"

@implementation FISGithubAPIClient

+ (void) getGitHubReposWithConpletion: (void (^) (NSArray *repos))block {
    
    NSURLSession *urlSession = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"https://api.github.com/repositories?client_id=39e42e107aedb4330920&client_secret=81c744473f3f8bfb4fbe633d38d84260c3757780"];
    
    NSURLSessionDataTask *task = [urlSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error.description );
        }
        NSArray *repositories = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@", repositories);
        block(repositories);

        }];
    
    [task resume];
    
}


@end
