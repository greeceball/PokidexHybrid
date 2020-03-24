//
//  PokemonController.m
//  PokedexHybrid
//
//  Created by Colby Harris on 3/24/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

#import "PokemonController.h"
#import "Pokemon.h"

static NSString * const baseURLString = @"https://pokeapi.co/api/v2/pokemon";

@implementation PokemonController

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^)(Pokemon * _Nullable))completion
{
    // let baseURL: URL = URL(fromString: baseURLString)
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    // let searchURL = baseurl.appendingPathComponent(searchTerm)
    NSURL *finalURL = [baseURL URLByAppendingPathComponent:searchTerm];

    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"Error fetching Pokemon from Searchterm: %@", error);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"Error fetching pokemon Data from searchterm: %@", error);
            completion(nil);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error: &error];
        
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"Error fetching JSON Dictionary: %@", error);
            completion(nil);
            return;
            
        }
        
        Pokemon *pokemon = [[Pokemon alloc] initWithDictionary:jsonDictionary];
        completion(pokemon);
        
        
    }] resume];

}


@end
