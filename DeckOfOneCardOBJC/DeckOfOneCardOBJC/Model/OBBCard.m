//
//  OBBCard.m
//  DeckOfOneCardOBJC
//
//  Created by Owen Barrott on 9/29/20.
//  Copyright © 2020 Owen Barrott. All rights reserved.
//

#import "OBBCard.h"

@implementation OBBCard

- (instancetype)initWithCardValue:(NSString *)value suit:(NSString *)suit imagePath:(NSString *)imagePath
{
    self = [super init];
    
    if (self)
    {
        _value = value;
        _suit = suit;
        _imagePath = imagePath;
    }
    return self;
}

- (OBBCard *)initWithDictionary:(NSDictionary *)topLevelDictionary
{
    NSArray* cardsArray = [topLevelDictionary objectForKey:@"cards"];
    NSLog(@"cards: %@", cardsArray);
    
    NSDictionary* cardReturned = [cardsArray objectAtIndex:0];
    
    NSString *suit = [cardReturned objectForKey:@"suit"];
    NSString *value = [cardReturned objectForKey:@"value"];
    NSString *imagePath = [cardReturned objectForKey:@"image"];
    
    return [self initWithCardValue:value suit:suit imagePath:imagePath];
}

@end
