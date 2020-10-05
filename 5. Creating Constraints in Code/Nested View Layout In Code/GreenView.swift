//
//  GreenView.swift
//  Nested View Layout In Code
//
//  Created by Vladislav Tarasevich on 28.09.2020.
//

import UIKit

final class GreenView: UIView {

    // MARK: - Private properties

    private let redView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()

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

        configureLayout()
        configureUI()
    }

    private func configureLayout() {
        NSLayoutConstraint.activate([
            redView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            redView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2),
            redView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            redView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25)
        ])
    }

    private func configureUI() {
        backgroundColor = .green
    }

}
