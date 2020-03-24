//
//  Pokemon.m
//  PokedexHybrid
//
//  Created by Colby Harris on 3/24/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

#import "Pokemon.h"

// class Pokemon {
@implementation Pokemon


-(instancetype)initWithName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities
{
    self = [super init];
    
    if (self)
    {
        _name = name;
        _identifier = identifier;
        _abilities = abilities;
    }
    
    return self;
}

- (instancetype)init
{
    // return Pokemon(name: "", identifier: 0, abilities: [])
    return [self initWithName:@"" identifier:0 abilities:@[]];
}
@end

@implementation Pokemon (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    
    NSString *name = dictionary[@"name"];
    NSInteger identifier = [dictionary[@"id"] integerValue];
    NSArray *abilitiesDictionaryArray = dictionary[@"abilities"];
    
    //Place holder for our abilities
    //let abilities: [String] = []
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    
    // loop through all of the abilities given to us
    for (NSDictionary *abilityDictionary in abilitiesDictionaryArray)
    {
        // goes into first level of json
        NSDictionary *nestedDictionary = abilityDictionary[@"ability"];
        
        // grabs the name from our first level
        NSString *abilityName = nestedDictionary[@"name"];
        
        // adds the name we got to out placeholder array
        [abilities addObject:abilityName];
        
    }
    // return Pokemon(name: name, identifier: identifier, abilities: abilities)
    return [self initWithName:name identifier:identifier abilities:abilities];
}

@end
