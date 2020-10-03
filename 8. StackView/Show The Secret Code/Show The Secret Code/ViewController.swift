//
//  ViewController.swift
//  Show The Secret Code
//
//  Created by Vladislav Tarasevich on 03.10.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainStackView: UIStackView!
    @IBOutlet var horizontalStackView: UIStackView!
    @IBOutlet var codeSwitch: UISwitch!

    var coverView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        hideCode()
    }

    private func hideCode() {
        coverView = horizontalStackView.addForegroundView(with: .purple, cornerRadius: 10.0)
    }

    @IBAction func showCode(_ sender: Any) {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.25,
                                                       delay: 0,
                                                       options: [],
                                                       animations: { self.configureCover() },
                                                       completion: nil)
    }

    private func configureCover() {
        coverView.isHidden = !codeSwitch.isOn
    }

}

// MARK: - Extension UIStackView

extension UIStackView {

    fileprivate func addForegroundView(with color: UIColor, cornerRadius: CGFloat = 0) -> UIView {
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .purple
        backgroundView.layer.cornerRadius = cornerRadius
        addSubview(backgroundView)

        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor)
        ])
        return backgroundView
    }

}

