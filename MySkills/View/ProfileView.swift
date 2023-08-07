//
//  ProfileView.swift
//  MySkills
//
//  Created by Alisher Manatbek on 05.08.2023.
//

import UIKit
import Foundation

class ProfileView: UIView {
    
    private lazy var container: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile".localized
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var centerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let image = UIImage(named: "Avatar")
        let imageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var fullnameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\("Alisher".localized) \("Manatbek".localized) \n \("Almatuly".localized)"
        return label
    }()
    
    private lazy var stackLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "stack".localized
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Almaty".localized
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var locationImageView: UIImageView = {
        let image = UIImage(named: "Location")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var location: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationImageView, locationLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 2.0
        return stackView
    }()
    
    private lazy var skillLabel: UILabel = {
        let label = UILabel()
        label.text = "My Skills".localized
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private var penImage = UIImage(systemName: "highlighter")
    private var doneImage = UIImage(systemName: "checkmark.circle")
    
    private lazy var customizeButton: UIButton = {
        let button = UIButton()
        button.setImage(penImage, for: .normal)
        button.tintColor = .label
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var isEditing: Bool = false {
        didSet {
            skillList.reloadData()
            if isEditing == false {
                customizeButton.setImage(penImage, for: .normal)
            } else {
                customizeButton.setImage(doneImage, for: .normal)
            }
        }
    }
    
    private lazy var skillList: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        view.showsVerticalScrollIndicator = false
        view.register(SkillCell.self, forCellWithReuseIdentifier: "cell")
        return view
    }()
    
}

// MARK: - ProfileViewDelegate

extension ProfileView: ProfileViewDelegate {

    func configure() {
        addSubview(container)
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])

        container.addSubview(titleView)
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: container.topAnchor),
            titleView.widthAnchor.constraint(equalTo: container.widthAnchor),
        ])

        titleView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor, constant: safeAreaInsets.top + 18.0)
        ])

        titleView.addSubview(avatarImageView)
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 120.0),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120.0),
            avatarImageView.centerXAnchor.constraint(equalTo: titleView.centerXAnchor),
            avatarImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24.0)
        ])

        avatarImageView.layoutIfNeeded()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2.0

        titleView.addSubview(fullnameLabel)
        NSLayoutConstraint.activate([
            fullnameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16.0),
            fullnameLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor)
        ])

        titleView.addSubview(stackLabel)
        NSLayoutConstraint.activate([
            stackLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor),
            stackLabel.topAnchor.constraint(equalTo: fullnameLabel.bottomAnchor, constant: 4.0)
        ])

        NSLayoutConstraint.activate([
            locationImageView.widthAnchor.constraint(equalToConstant: 16.0),
            locationImageView.heightAnchor.constraint(equalToConstant: 16.0)
        ])

        titleView.addSubview(location)
        NSLayoutConstraint.activate([
            location.topAnchor.constraint(equalTo: stackLabel.bottomAnchor),
            location.centerXAnchor.constraint(equalTo: titleView.centerXAnchor)
        ])

        location.layoutIfNeeded()
        titleLabel.layoutIfNeeded()
        fullnameLabel.layoutIfNeeded()
        stackLabel.layoutIfNeeded()
        NSLayoutConstraint.activate([
            titleView.heightAnchor.constraint(equalToConstant: 18.0 + safeAreaInsets.top + 16.0 + 24.0 + avatarImageView.height + titleLabel.height + fullnameLabel.height + stackLabel.height + 4.0 + location.height + 20.0)
        ])

        container.addSubview(centerView)
        NSLayoutConstraint.activate([
            centerView.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            centerView.widthAnchor.constraint(equalTo: container.widthAnchor)
        ])

        centerView.addSubview(skillLabel)
        NSLayoutConstraint.activate([
            skillLabel.topAnchor.constraint(equalTo: centerView.topAnchor, constant: 20.0),
            skillLabel.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 16.0)
        ])

        centerView.addSubview(customizeButton)
        NSLayoutConstraint.activate([
            customizeButton.widthAnchor.constraint(equalToConstant: 24.0),
            customizeButton.heightAnchor.constraint(equalToConstant: 24.0),
            customizeButton.topAnchor.constraint(equalTo: centerView.topAnchor, constant: 20.0),
            customizeButton.trailingAnchor.constraint(equalTo: centerView.trailingAnchor, constant: -16.0)
        ])

        skillLabel.layoutIfNeeded()
        NSLayoutConstraint.activate([
            centerView.heightAnchor.constraint(equalToConstant: skillLabel.height + 20.0)
        ])

        container.addSubview(skillList)
        addSubview(skillList)
        NSLayoutConstraint.activate([
            skillList.topAnchor.constraint(equalTo: centerView.bottomAnchor, constant: 10.0),
            skillList.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            skillList.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16.0),
            skillList.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16.0)
        ])
    }
    
    @objc func didTapButton() {
        isEditing = !isEditing
    }

}

// MARK: - UICollectionViewDelegate

extension ProfileView: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension ProfileView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SkillCell
        guard let cell = cell else { return UICollectionViewCell() }
        cell.skillText.text = "\(indexPath.row)"
        if isEditing == true {
            cell.contentView.wobble()
        } else {
            cell.contentView.layerremoveAllAnimations()
        }
        return cell
    }
    
}
