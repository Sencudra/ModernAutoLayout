//
//  RootViewController.swift
//  Floating Content
//
//  Created by Vladislav Tarasevich on 06.10.2020.
//

import UIKit

class RootViewController: UIViewController {

    // MARK: - Private types

    private enum Constant {

        static var spacing: CGFloat {
            return UIStackView.spacingUseSystem
        }

        enum Label {

            static var text: String {
                return "Get Ready!"
            }

            static var fontSize: CGFloat {
                return 52.0
            }

        }

        enum ImageView {

            static var imageName: String {
                return "rectangle.3.offgrid.fill"
            }

            static var width: CGFloat {
                return 330
            }

            static var height: CGFloat {
                return 300
            }

        }

        enum Button {

            static var title: String {
                return "Start"
            }

            static var fontSize: CGFloat {
                return 24
            }

            static var backgroundColor: UIColor {
                return .green
            }

        }

    }

    // MARK: - Private methods

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        return scrollView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [label, imageView, button])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = Constant.spacing
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        return stackView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: Constant.Label.fontSize)
        label.text = Constant.Label.text
        return label
    }()

    private let imageView: UIView = {
        let image = UIImageView(image: UIImage(systemName: Constant.ImageView.imageName))
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: Constant.ImageView.width),
            image.heightAnchor.constraint(equalToConstant: Constant.ImageView.height)
        ])
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .orange
        return image
    }()

    private let button: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constant.Button.title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: Constant.Button.fontSize)
        button.backgroundColor = Constant.Button.backgroundColor
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return button
    }()

    private let infoButton: UIButton = {
        let button = UIButton(type: .infoDark)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)

        addSubviews()
        configureUI()
    }

    // MARK: - Private methods

    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(infoButton)

        NSLayoutConstraint.activate([
            infoButton.leadingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.leadingAnchor),
            infoButton.topAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.topAnchor),

            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            stackView.centerXAnchor.constraint(equalTo: scrollView.contentLayoutGuide.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),

            button.leadingAnchor.constraint(equalTo: stackView.layoutMarginsGuide.leadingAnchor)
        ])
    }

    @objc
    private func keyboardDidShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
                return
        }

        let keyboardSize = keyboardFrame.cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        adjustContentInsets(contentInsets)
    }

    @objc
    private func keyboardWillHide(_ notification: Notification) {
        adjustContentInsets(.zero)
    }

    private func adjustContentInsets(_ contentInsets: UIEdgeInsets) {
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

    private func configureUI() {
        view.backgroundColor = .yellow
    }

}

