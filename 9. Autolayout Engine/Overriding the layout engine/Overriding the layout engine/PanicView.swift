//
//  PanicView.swift
//  Overriding the layout engine
//
//  Created by Vladislav Tarasevich on 04.10.2020.
//

import UIKit

final class PanicView: UIView {

    // MARK: - Private types

    private enum Constant {

        static var spacing: CGFloat {
            return 16.0
        }

    }

    // MARK: - Private properties

    @IBOutlet private var notPannicButton: UIButton!
    @IBOutlet private var panicButton: UIButton!
    @IBOutlet private var stackView: UIStackView!

    // MARK: - Init

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    // MARK: - Overrides

    override func layoutSubviews() {
        super.layoutSubviews()

        let minButtonWidth = max(notPannicButton.intrinsicContentSize.width, panicButton.intrinsicContentSize.width)
        let minHorizontalWidth = minButtonWidth * 2 + Constant.spacing
        let marginWidth = layoutMarginsGuide.layoutFrame.width

        stackView.axis = (minHorizontalWidth > marginWidth) ? .vertical : .horizontal
    }

}
