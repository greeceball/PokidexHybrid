//
//  Pokemon.h
//  PokedexHybrid
//
//  Created by Colby Harris on 3/24/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Pokemon : NSObject

// creating a variable name of type string and a constant
// let name: String
@property (nonatomic, copy, readonly) NSString *name;

// creating a variable identifier of type int as a constant. no pointer because its a primitive type
// let identifier: Int
@property (nonatomic, readonly) NSInteger identifier;

// creating a variable array abilities of type string as a constant. Need pointers for both strings and array because neither are primitive types
// let abilities: [String]
@property (nonatomic,copy, readonly) NSArray<NSString *> *abilities;

// declaring an initializer called init with name,
// func initWithName(name: String, identifier: Int, abilities: [String]) -> InstanceType
- (instancetype)initWithName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities
//
NS_DESIGNATED_INITIALIZER;


@end

@interface Pokemon (JSONConvertable)
// creating a function that will allow us to iterate through (parse) a dictionary and use its values
// func initWithDictionary(dictionary
-(instancetype)initWithDictionary:(NSDictionary <NSString *, id>*)dictionary;

@end


NS_ASSUME_NONNULL_END
