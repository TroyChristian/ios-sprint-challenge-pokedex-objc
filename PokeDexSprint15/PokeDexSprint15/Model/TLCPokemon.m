//
//  TLCPokemon.m
//  PokeDexSprint15
//
//  Created by Lambda_School_Loaner_219 on 2/28/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import "TLCPokemon.h"

@implementation TLCPokemon
-(instancetype _Nonnull)initWithDictionary:(nonnull NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _name = dictionary[@"name"];
        _detailsURL = [NSURL URLWithString:dictionary[@"url"]];
        _abilities = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)pokemonDetailsWithDictionary:(nonnull NSDictionary *)dictionary {
    //step down into json
    NSArray *abilitiesDictionaries = dictionary[@"abilities"];
    
    for (NSDictionary *abilityDictionary in abilitiesDictionaries) {
        NSDictionary *ability = abilityDictionary[@"ability"];
        NSString *abilityName = ability[@"name"];
        [self.abilities addObject: abilityName];
    }
    //
    self.pokemonId = [dictionary[@"id"] intValue]; //cast to integer to fit model
    //step down into json
    
    
    NSDictionary *spritesDictionary = dictionary[@"sprites"];
    NSURL *spriteURL = [NSURL URLWithString:spritesDictionary[@"front_default"]];
    NSData *imageData = [NSData dataWithContentsOfURL:spriteURL];
    self.pokemonSprite = [UIImage imageWithData:imageData];
}

@end
