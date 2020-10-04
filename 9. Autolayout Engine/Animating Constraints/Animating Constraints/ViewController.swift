//
//  ViewController.swift
//  Animating Constraints
//
//  Created by Vladislav Tarasevich on 04.10.2020.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Types

    enum Speed {
        case slow
        case fast
    }

    // MARK: - Properties

    private var speed: Speed = .slow {
        didSet {
            if oldValue != speed {
                animateChange(for: speed)
            }
        }
    }

    @IBOutlet var slowHeightConstraint: NSLayoutConstraint!
    @IBOutlet var fastHeightConstraint: NSLayoutConstraint!

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - User actions

    @IBAction func slowTapped(_ sender: Any) {
        speed = .slow
    }

    @IBAction func fastTapped(_ sender: Any) {
        speed = .fast
    }

    // MARK: - Private methods

    private func animateChange(for speed: Speed) {
        switch speed {
        case .slow:
            NSLayoutConstraint.activate([slowHeightConstraint])
            NSLayoutConstraint.deactivate([fastHeightConstraint])

        case .fast:
            NSLayoutConstraint.activate([fastHeightConstraint])
            NSLayoutConstraint.deactivate([slowHeightConstraint])
        }

        let animator = UIViewPropertyAnimator(duration: 0.25, curve: .linear) {
            self.view.layoutIfNeeded()
        }
        animator.startAnimation()
    }

}

