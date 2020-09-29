//
//  OBBCardController.m
//  DeckOfOneCardOBJC
//
//  Created by Owen Barrott on 9/29/20.
//  Copyright © 2020 Owen Barrott. All rights reserved.
//

#import "OBBCardController.h"



@implementation OBBCardController

static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new/draw";

+ (void)fetchCardCompletion:(void (^)(OBBCard * _Nonnull))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSLog(@"%@", baseURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:baseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      {
        if (error)
        {
            NSLog(@"There was an error: %@, %@.", error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if(!data)
        {
            NSLog(@"No data was returned.");
            return completion (nil);
        }
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error: &error];
        
        if (!topLevelDictionary)
        {
            NSLog(@"Error parsing the JSON: %@", error);
            return completion (nil);
        }
        OBBCard *card = [[OBBCard alloc] initWithDictionary:topLevelDictionary];
        completion(card);
        
    }] resume];
}


+ (void)fetchCardImageForCard:(OBBCard *)card completion:(void (^)(UIImage *))completion
{
    NSURL *imageURL = [NSURL URLWithString:card.imagePath];
    NSLog(@"%@", imageURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL: imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was an error fetching the image: %@, %@", error, error.localizedDescription);
            return completion(nil);
        }
        
        if (!data)
        {
            NSLog(@"There was no data found for the image.");
            return completion(nil);
        }
        
        UIImage *image = [UIImage imageWithData:data];
        completion(image);
    }] resume];
}

@end
