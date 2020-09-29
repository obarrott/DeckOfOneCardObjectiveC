//
//  OBBCardController.h
//  DeckOfOneCardOBJC
//
//  Created by Owen Barrott on 9/29/20.
//  Copyright © 2020 Owen Barrott. All rights reserved.
//

#import "OBBCard.h"
#import <UIKit/UIkit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OBBCardController : NSObject

+ (void)fetchCardCompletion:(void (^)(OBBCard *))completion;

+ (void)fetchCardImageForCard:(OBBCard *)card completion:(void (^) (UIImage*))completion;

@end

NS_ASSUME_NONNULL_END
