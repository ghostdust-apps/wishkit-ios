//
//  WishCell.swift
//  wishkit-ios
//
//  Created by Martin Lasek on 2/9/23.
//  Copyright © 2023 Martin Lasek. All rights reserved.
//

import UIKit

final class WishCell: UITableViewCell {

    static let identifier = "wishcellid"


//    private var singleWishResponse: SingleWishResponse?

    private let containerView = ContainerView()

    private let voteButton = SmallVoteButton()

    private let titleLabel = UILabel()

    private let descriptionLabel = UILabel()

//    var delegate: WishCellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public

//    func set(response: SingleWishResponse) {
//        self.singleWishResponse = response
//
//        voteButton.voteCountLabel.text = String(describing: response.votingUsers.count)
//        titleLabel.text = response.title
//        descriptionLabel.text = response.description
//
//        let userUUID = UUIDManager.getUUID()
//        if response.userUUID == userUUID || response.votingUsers.contains(where: { $0.uuid == userUUID }) {
//            voteButton.arrowIV.tintColor = .customRed
//        } else {
//            voteButton.arrowIV.tintColor = .tertiaryLabel
//        }
//    }

    // MARK: - Setup View

    private func setupView() {
        backgroundColor = .clear
        selectionStyle = .none

        setupContainerView()
        setupVoteButton()
        setupTitleLabel()
        setupDescriptionLabel()
    }

    private func setupContainerView() {
        contentView.addSubview(containerView)

        containerView.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            bottom: contentView.bottomAnchor,
            trailing: contentView.trailingAnchor,
            padding: UIEdgeInsets(top: 0, left: 15, bottom: 15, right: 15)
        )
    }

    private func setupVoteButton() {
        containerView.addSubview(voteButton)

        voteButton.anchor(
            leading: containerView.leadingAnchor,
            centerY: containerView.centerYAnchor,
            size: CGSize(width: 60, height: 0)
        )

//        voteButton.addTarget(self, action: #selector(voteAction), for: .touchUpInside)
    }

    private func setupTitleLabel() {
        containerView.addSubview(titleLabel)

        titleLabel.anchor(
            top: containerView.topAnchor,
            leading: voteButton.trailingAnchor,
            trailing: containerView.trailingAnchor,
            padding: UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 15)
        )

//        titleLabel.font = AppFont.largeBold
    }

    private func setupDescriptionLabel() {
        containerView.addSubview(descriptionLabel)

        descriptionLabel.anchor(
            top: titleLabel.bottomAnchor,
            leading: titleLabel.leadingAnchor,
            bottom: containerView.bottomAnchor,
            trailing: titleLabel.trailingAnchor,
            padding: UIEdgeInsets(top: 5, left: 0, bottom: 15, right: 0)
        )

//        descriptionLabel.font = AppFont.medium
    }

    // MARK: - Action

//    @objc private func voteAction() {
//        guard let response = singleWishResponse else {
//            printError(self, "Is missing \(SingleWishResponse.self)")
//            return
//        }
//
//        let rootViewController = UIApplication
//            .shared
//            .connectedScenes
//            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
//            .first?
//            .rootViewController
//
//        if let rootViewController = rootViewController, response.state == .implemented {
//            AlertManager.confirmMessage(on: rootViewController, message: "You cannot vote for a wish that is already implemented 😊")
//            return
//        }
//
//        // Check if own wish.
//        if response.userUUID == UUIDManager.getUUID() {
//            printWarning(self, "You cannot vote for your own wish.")
//
//            if let rootViewController = rootViewController {
//                AlertManager.confirmMessage(on: rootViewController, message: "You cannot vote for your own wish.")
//            }
//
//            return
//        }
//
//        // Check if already voted.
//        if response.votingUsers.contains(where: {$0.uuid == UUIDManager.getUUID() }) {
//            printWarning(self, "You can only vote once.")
//
//            if let rootViewController = rootViewController {
//                AlertManager.confirmMessage(on: rootViewController, message: "You can only vote once.")
//            }
//
//            return
//        }
//
//        let voteRequest = VoteWishRequest(wishId: response.id)
//
//        WishApi.voteWish(voteRequest: voteRequest) { result in
//            switch result {
//            case .success:
//                guard let delegate = self.delegate else {
//                    printError(self, "Delegate is missing.")
//                    return
//                }
//
//                delegate.voteWasTapped()
//            case .failure(let error):
//                printError(self, error.description)
//                DispatchQueue.main.async {
//                    if let rootViewController = rootViewController {
//                        AlertManager.confirmMessage(on: rootViewController, message: error.description)
//                    }
//                }
//            }
//        }
//    }
}
