//
//  ViewController.swift
//  Margins in Interace Builder
//
//  Created by Vladislav Tarasevich on 29.09.2020.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Private proeprties

    private let tileView: UIView = {
        let view = TileView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tileView)

        configureUI()
        layoutSubviews()
    }

    // MARK: - Private methods

    private func configureUI() {
        view.backgroundColor = .yellow
    }

    private func layoutSubviews() {
        let insetValue: CGFloat = 50.0
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: insetValue, leading: insetValue, bottom: insetValue, trailing: insetValue)

        NSLayoutConstraint.activate([
            tileView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            tileView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            tileView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            tileView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.25)
        ])
    }

}

