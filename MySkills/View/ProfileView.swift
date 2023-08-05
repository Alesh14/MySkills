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
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
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
            titleView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            titleView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            titleView.heightAnchor.constraint(equalToConstant: 18.0 + safeAreaInsets.top)
        ])
    }

}
