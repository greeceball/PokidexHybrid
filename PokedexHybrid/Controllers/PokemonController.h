//
//  PokemonController.h
//  PokedexHybrid
//
//  Created by Colby Harris on 3/24/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@class Pokemon; // more common to do this vs. importing the .h file in the header


@interface PokemonController : NSObject
// static func fetchPokemon(searchTerm: String, completion: @escaping(Pokemon) -> void)
+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void(^)(Pokemon *)) completion;

@end

NS_ASSUME_NONNULL_END
