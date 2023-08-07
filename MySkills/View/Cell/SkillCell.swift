//
//  SkillCell.swift
//  MySkills
//
//  Created by Alisher Manatbek on 06.08.2023.
//

import UIKit

class SkillCell: UICollectionViewCell {
    
    lazy var skillText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemGray5
        
        contentView.addSubview(skillText)
        skillText.textAlignment = .center
        NSLayoutConstraint.activate([
            skillText.topAnchor.constraint(equalTo: contentView.topAnchor),
            skillText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            skillText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            skillText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
