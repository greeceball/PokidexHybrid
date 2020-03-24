//
//  PokemonViewController.swift
//  PokedexHybrid
//
//  Created by Colby Harris on 3/24/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController, UISearchBarDelegate {

    //MARK: - Outlets
    @IBOutlet weak var pokemonSearchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    //MARK: - Properties
    var pokemon: Pokemon? {
        didSet {
         updateViews()
        }
    }
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonSearchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text?.lowercased() else { return }
        
        PokemonController.fetchPokemon(forSearchTerm: searchTerm) { (pokemon) in
            self.pokemon = pokemon
            
        }
        
        
    }
    func updateViews() {
        guard let pokemon = pokemon else { return }
        DispatchQueue.main.async {
            self.nameLabel.text = pokemon.name
            self.idLabel.text = "ID: \(pokemon.identifier)"
            self.abilitiesLabel.text = "Abilities: \(pokemon.abilities)"
        }
    }
}
