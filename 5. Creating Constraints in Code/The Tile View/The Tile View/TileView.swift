//
//  GreenView.swift
//  The Tile View
//
//  Created by Vladislav Tarasevich on 28.09.2020.
//

import UIKit

final class TileView: UIView {

    // MARK: - Private properties

    let blueView = makeView(for: .blue)
    let redView = makeView(for: .red)

    // MARK: - Init

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }

    // MARK: - Private methods

    private func commonInit() {
        addSubview(blueView)
        addSubview(redView)

        configureLayout()
        configureUI()
    }

    private func configureLayout() {
        NSLayoutConstraint.activate([
            blueView.centerYAnchor.constraint(equalTo: centerYAnchor),
            blueView.topAnchor.constraint(equalTo: topAnchor, constant: 25.0),
            blueView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25.0),
            redView.topAnchor.constraint(equalTo: blueView.topAnchor),
            redView.bottomAnchor.constraint(equalTo: blueView.bottomAnchor),
            redView.leadingAnchor.constraint(equalTo: blueView.trailingAnchor, constant: 25.0),
            redView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25.0),
            redView.widthAnchor.constraint(equalTo: blueView.widthAnchor)
        ])
    }

    private func configureUI() {
        backgroundColor = .green
    }

    // MARK: - Private static methods

    private static func makeView(for color: UIColor) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        return view
    }

}
