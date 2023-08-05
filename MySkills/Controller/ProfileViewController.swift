//
//  ProfileViewController.swift
//  MySkills
//
//  Created by Alisher Manatbek on 01.08.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileView: ProfileViewDelegate?
    
    init(profileView: ProfileViewDelegate) {
        self.profileView = profileView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        guard let profileView = profileView else { return }
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        guard let profileView = profileView else { return }
        profileView.configure()
    }
    
}
