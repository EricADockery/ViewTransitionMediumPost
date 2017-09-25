//
//  ViewController.swift
//  collectionViewTransitionTest
//
//  Created by Eric Dockery on 9/22/17.
//  Copyright © 2017 Eric Dockery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var myPokemon = [Pokemon]()

    let transition = TransitionAnimator()
    var selectedCell = UICollectionViewCell()
    override func viewDidLoad() {
        super.viewDidLoad()
        addMyPokemon()
        collectionView.dataSource = self
        collectionView.delegate = self
        transition.dismissCompletion = {
            self.selectedCell.isHidden = false
        }
    }

    private func addMyPokemon() {
        let char = Pokemon(name: "Charmander", details: "He is a fire type starter from Kanto", image:  "Charmander")
        let bulb = Pokemon(name: "Bulbasuar", details: "He is a grass type starter from Kanto", image: "bulb")
        let squirt = Pokemon(name: "Squirtle", details: "He is a water type starter from Kanto", image:  "Squirtle")
        let torchy = Pokemon(name: "Torchic", details: "He is a fire type starter from Kanto", image: "torchic")
        let froakie = Pokemon(name: "Froakie", details: "He is a water type starter from Hoenn", image: "froakie")
        let chikorita = Pokemon(name: "Chikorita", details: "He is a grass type starter from Johto", image: "Chikorita")

        myPokemon.append(char)
        myPokemon.append(bulb)
        myPokemon.append(squirt)
        myPokemon.append(torchy)
        myPokemon.append(froakie)
        myPokemon.append(chikorita)

    }
    
}

extension ViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myPokemon.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pokemonCell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as! PokemonCell
        pokemonCell.pokemonNameLabel.text = myPokemon[indexPath.row].pokemonName

        pokemonCell.updateWithImage(image: UIImage(named: myPokemon[indexPath.row].pokemonImage))
        return pokemonCell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCell = collectionView.cellForItem(at: indexPath) as! PokemonCell
        let pokemonDetailViewController = storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        pokemonDetailViewController.pokemonName =  myPokemon[indexPath.row].pokemonName
        pokemonDetailViewController.pokemonImageName = myPokemon[indexPath.row].pokemonImage
        pokemonDetailViewController.pokemonDetails = myPokemon[indexPath.row].pokemonDetails
        pokemonDetailViewController.transitioningDelegate = self
        present(pokemonDetailViewController, animated: true, completion: nil)
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let originFrame = selectedCell.superview?.convert(selectedCell.frame, to: nil) else {
            return transition
        }
        transition.originFrame = originFrame
        transition.presenting = true
        selectedCell.isHidden = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = false
        return transition
    }
}


