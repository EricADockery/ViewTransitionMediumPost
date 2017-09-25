//
//  DetailViewController.swift
//  collectionViewTransitionTest
//
//  Created by Eric Dockery on 9/22/17.
//  Copyright © 2017 Eric Dockery. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var pokemonDetailLabel: UILabel!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!

    var pokemonName: String = ""
    var pokemonDetails: String = ""
    var pokemonImageName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actionClose(_:))))
        pokemonNameLabel.text = pokemonName
        pokemonDetailLabel.text = pokemonDetails
        pokemonImageView.image = UIImage(named: pokemonImageName)
    }


    @objc func actionClose(_ tap: UITapGestureRecognizer) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
