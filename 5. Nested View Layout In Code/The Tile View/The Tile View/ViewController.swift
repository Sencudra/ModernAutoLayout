//
//  ViewController.swift
//  The Tile View
//
//  Created by Vladislav Tarasevich on 28.09.2020.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        addTileView()
    }

    // MARK: - Private methods

    private func addTileView() {
        let tileView = TileView()
        view.addSubview(tileView)

        tileView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tileView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tileView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50.0),
            tileView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50.0),
            tileView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)
        ])
    }

}

