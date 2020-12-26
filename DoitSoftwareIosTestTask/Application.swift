//
//  Application.swift
//  DoitSoftwareIosTestTask
//
//  Created by Ihor Myroniuk on 26.12.2020.
//

import AUIKit

class Application: AUIEmptyApplication {
    // MARK: Launching
    
    override func didFinishLaunching() {
        super.didFinishLaunching()
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        presentationWindow.rootViewController = viewController
        presentationWindow.makeKeyAndVisible()
    }
    
    // MARK: Presentation
    
    private lazy var presentationWindow: UIWindow = {
        return window ?? UIWindow()
    }()
}
