//
//  TileView.swift
//  Margins in Interace Builder
//
//  Created by Vladislav Tarasevich on 29.09.2020.
//

import UIKit

final class TileView: UIView {

    // MARK: - Private properties

    private let redView = makeView(for: .red)
    private let blueView = makeView(for: .blue)

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
        addSubview(redView)
        addSubview(blueView)

        configureUI()
        configureLayout()
    }

    private func configureUI() {
        backgroundColor = .green
    }

    private func configureLayout() {
        let inset: CGFloat = 25.0
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)

        NSLayoutConstraint.activate([
            redView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            redView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            redView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            blueView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            blueView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            blueView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            redView.trailingAnchor.constraint(equalTo: blueView.leadingAnchor, constant: -inset),
            redView.widthAnchor.constraint(equalTo: blueView.widthAnchor)
        ])
    }

    // MARK: - Private static methods

    private static func makeView(for color: UIColor) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        return view
    }

}
