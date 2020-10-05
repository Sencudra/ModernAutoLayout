//
//  ViewController.swift
//  Nested View Layout In Code
//
//  Created by Vladislav Tarasevich on 28.09.2020.
//

import UIKit

@IBDesignable
class ViewController: UIViewController {

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        addGreenView()
    }

    // MARK: - Private methods

    private func addGreenView() {
        let greenView = GreenView()
        view.addSubview(greenView)

        greenView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greenView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50.0),
            greenView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50.0)
        ])
    }

}
