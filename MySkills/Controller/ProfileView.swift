//
//  ViewController.swift
//  MySkills
//
//  Created by Alisher Manatbek on 01.08.2023.
//

import UIKit

class ProfileView: UIViewController {
    
    let profile = ProfileModel(name: "Иван", surname: "Иванов", patronymic: "Иванович", profileImage: "Profile", city: "Воронеж", shortInfo: "Middle iOS-разработчик, опыт более 2-х лет", skills: [])
    
    private lazy var container: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private lazy var profileImageView: UIImageView = {
        let image = UIImage(named: profile.profileImage)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var fullnameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 35.0, weight: .bold)
        label.text = "\(profile.name) \(profile.surname) \n \(profile.patronymic)"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var shortInformationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .gray
        label.text = profile.shortInfo
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .gray
        label.text = profile.city
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var profileView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var locationImage: UIImageView = {
        let image = UIImage(named: "Location")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var cityView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [locationImage, cityLabel])
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView()
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    private lazy var mySkillsLabel: UILabel = {
        let label = UILabel()
        label.text = "Мои навыки"
        label.font = label.font.withSize(23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var penImage = UIImage(named: "Pencil")
    private lazy var doneImage = UIImage(named: "Done")

    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(penImage, for: .normal)
        button.addTarget(self, action: #selector(didEditButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var isCustomizing = false {
        didSet {
            if isCustomizing {
                editButton.setImage(doneImage, for: .normal)
            } else {
                editButton.setImage(penImage, for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Профиль"
        view.addSubview(container)
        container.addSubview(profileView)
        
        if let navigationController = navigationController {
            navigationController.navigationBar.backgroundColor = .systemGray5
        }
        
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        configureContainer()
        configureProfileView()
        
        container.addSubview(mySkillsLabel)
        configureMySkillsLabel()
    }
    
    func configureEditButton() {
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 20.0),
            editButton.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -16.0)
        ])
    }
    
    func configureMySkillsLabel() {
        NSLayoutConstraint.activate([
            mySkillsLabel.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 20.0),
            mySkillsLabel.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 16.0)
        ])
    }
    
    func configureProfileView() {
        NSLayoutConstraint.activate([
            profileView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            profileView.topAnchor.constraint(equalTo: container.topAnchor),
            profileView.leftAnchor.constraint(equalTo: container.leftAnchor),
            profileView.rightAnchor.constraint(equalTo: container.rightAnchor)
        ])
        
        let spaceView1 = UIView()
        spaceView1.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            spaceView1.heightAnchor.constraint(equalToConstant: 24.0)
        ])
        
        let spaceView2 = UIView()
        spaceView2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            spaceView2.heightAnchor.constraint(equalToConstant: 16.0)
        ])
        
        profileView.addArrangedSubview(spaceView1)
        profileView.addArrangedSubview(profileImageView)
        profileView.addArrangedSubview(spaceView2)
        profileView.addArrangedSubview(fullnameLabel)
        
        let spaceView3 = UIView()
        spaceView3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            spaceView3.heightAnchor.constraint(equalToConstant: 10.0)
        ])
        
        profileView.addArrangedSubview(spaceView3)
        profileView.addArrangedSubview(shortInformationLabel)
        profileView.addArrangedSubview(cityView)
        
        let spaceView4 = UIView()
        spaceView4.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            spaceView4.heightAnchor.constraint(equalToConstant: 20.0)
        ])
        
        profileView.addArrangedSubview(spaceView4)
        
        configureLocationImage()
        configureProfileImage()
    }

    func configureContainer() {
        let x = 0.0
        let y = view.safeAreaInsets.top
        let w = view.frame.width
        let h = view.frame.height - y
        container.frame = CGRect(x: x, y: y, width: w, height: h)
    }
    
    func configureLocationImage() {
        let size: CGFloat = 16.0
        NSLayoutConstraint.activate([
            locationImage.widthAnchor.constraint(equalToConstant: size),
            locationImage.heightAnchor.constraint(equalToConstant: size)
        ])
    }
    
    func configureProfileImage() {
        let side = 120.0
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: side),
            profileImageView.heightAnchor.constraint(equalToConstant: side)
        ])
    }
    
    @objc func didEditButtonTapped() {
        isCustomizing = !isCustomizing
    }
    
}

extension ProfileView: UICollectionViewDelegate {
    
}

extension ProfileView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
        
    }
    
}
