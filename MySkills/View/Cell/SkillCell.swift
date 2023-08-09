//
//  SkillCell.swift
//  MySkills
//
//  Created by Alisher Manatbek on 06.08.2023.
//

import UIKit

class SkillCell: UICollectionViewCell {
    var id: Int?
    var delegate: RemoveSkillProtocol?
    
    lazy var skillText: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus.circle.fill"), for: .normal)
        button.tintColor = .systemGray6
        button.backgroundColor = .systemGray4
        button.layer.cornerRadius = 15 / 2.0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapMinusButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 10.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(view)
        skillText.textAlignment = .center

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5.0),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5.0),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5.0),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        view.addSubview(skillText)
        NSLayoutConstraint.activate([
            skillText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            skillText.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        contentView.addSubview(minusButton)
        NSLayoutConstraint.activate([
            minusButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2.0),
            minusButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 15.0),
            minusButton.heightAnchor.constraint(equalToConstant: 15.0),
        ])
    }
    
    @objc func didTapMinusButton() {
        guard let id = id else { return }
        delegate?.remove(at: id)
        delegate = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
