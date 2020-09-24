//
//  RGBView.swift
//  Using A Custom View
//
//  Created by Vladislav Tarasevich on 24.09.2020.
//

import UIKit

@IBDesignable
final class RGBView: UIView {

    // MARK: - Private properties

    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    @IBInspectable
    var viewSpacing: CGFloat = 20.0 {
        didSet {
            setNeedsLayout()
        }
    }

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        configureView()
    }

    // MARK: - Overrides

    override func layoutSubviews() {
        let height = (bounds.height - 2 * viewSpacing) / 3

        redView.frame = CGRect(x: .zero, y: .zero, width: bounds.width, height: height)
        greenView.frame = CGRect(x: .zero, y: height + viewSpacing, width: bounds.width, height: height)
        blueView.frame = CGRect(x: .zero, y: 2 * (height + viewSpacing), width: bounds.width, height: height)
    }

    // MARK: - Private methods

    private func configureView() {
        addSubview(redView)
        addSubview(greenView)
        addSubview(blueView)
    }

}

