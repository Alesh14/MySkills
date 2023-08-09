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
        let profile = Profile(
                    name: "Alisher", surname: "Manatbek",
                    fathername: "Almatuly", photo: UIImage(named: "Avatar") ?? UIImage(),
                    stack: "stack", location: "Almaty",
                    skills: ["XCode", "Swift", "C++", "Java", "UIKit", "SnapKit", "MapKit", "SwiftUI", "ACM", "MVVM", "MVC"]
        )
        
        let profileView = ProfileView(profile: profile)
        let viewController = ProfileViewController(profileView: profileView)
        profileView.delegate = viewController
        return viewController
    }
    
}
