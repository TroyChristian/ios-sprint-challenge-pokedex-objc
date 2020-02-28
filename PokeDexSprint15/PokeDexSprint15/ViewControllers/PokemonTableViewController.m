//
//  PokemonTableViewController.m
//  PokeDexSprint15
//
//  Created by Lambda_School_Loaner_219 on 2/28/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import "PokemonTableViewController.h"
#import "PokemonDetailViewController.h"
#import "TLCPokemonController.h"
#import "TLCPokemon.h"

@interface PokemonTableViewController ()
@property(nonatomic) TLCPokemonController *pokemonController;

@end

@implementation PokemonTableViewController

-(instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _pokemonController = [[TLCPokemonController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.pokemonController retrievePokemon:^(NSError *error) {
        if (error) {
            NSLog(@"Error in pokemonController retrievePokemon: %@", error);
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
    }];
}
            
      

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.pokemonController getPokemon].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PokemonCell" forIndexPath:indexPath];
    cell.textLabel.text = [self.pokemonController getPokemon][indexPath.row].name;
    
    
    
  
    
    return cell;
}





#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    PokemonDetailViewController *detailVC = [segue destinationViewController];
    if ([segue.identifier isEqualToString:@"showPokemonDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        detailVC.pokemonController = self.pokemonController;
        detailVC.pokemon = [self.pokemonController getPokemon][indexPath.row];
    }
}


@end
