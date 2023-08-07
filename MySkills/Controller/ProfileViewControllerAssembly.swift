//
//  ProfileViewControllerAssembly.swift
//  MySkills
//
//  Created by Alisher Manatbek on 05.08.2023.
//

import UIKit
import Foundation

struct ProfileViewControllerAssembly {
    
    static let shared: ProfileViewControllerAssembly = ProfileViewControllerAssembly()
    
    var viewController: UIViewController {
        let profileView = ProfileView()
        let viewController = ProfileViewController(profileView: profileView)
        return viewController
    }
    
}
