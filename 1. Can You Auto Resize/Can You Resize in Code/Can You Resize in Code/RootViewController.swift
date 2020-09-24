//
//  RootViewController.swift
//  Can You Resize in Code
//
//  Created by Vladislav Tarasevich on 24.09.2020.
//

import UIKit

class RootViewController: UIViewController {

    // MARK: - Private properties

    let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemYellow

        view.addSubview(greenView)
        greenView.addSubview(redView)
    }

    override func viewWillLayoutSubviews() {
        layoutGreenSubview()
        layoutRedSubview()
    }

    // MARK: - Private methods

    private func layoutGreenSubview() {
        let margin: CGFloat = 50.0
        let width: CGFloat = view.bounds.width - 2 * margin
        let height: CGFloat = view.bounds.height - 2 * margin

        greenView.frame = CGRect(x: margin, y: margin, width: width, height: height)
    }

    private func layoutRedSubview() {
        let height: CGFloat = 100
        let horizontalMargin: CGFloat = 25.0
        let verticalMargin: CGFloat = (greenView.bounds.height - height) / 2
        let width: CGFloat = greenView.bounds.width - 2 * horizontalMargin

        redView.frame = CGRect(x: horizontalMargin, y: verticalMargin, width: width, height: height)
    }

}

