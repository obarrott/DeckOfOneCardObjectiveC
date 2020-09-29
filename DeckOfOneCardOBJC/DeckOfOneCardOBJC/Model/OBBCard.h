//
//  OBBCard.h
//  DeckOfOneCardOBJC
//
//  Created by Owen Barrott on 9/29/20.
//  Copyright © 2020 Owen Barrott. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OBBCard : NSObject

@property (nonatomic, copy, readonly) NSString *value;
@property (nonatomic,copy,readonly) NSString *suit;
@property (nonatomic,copy, readonly) NSString *imagePath;

- (instancetype)initWithCardValue:(NSString *)value
                             suit:(NSString *)suit
                        imagePath:(NSString *)imagePath;

- (instancetype)initWithDictionary:(NSDictionary *)topLevelDictionary;

@end

NS_ASSUME_NONNULL_END
