//
//  MainViewController.swift
//  whatsAppClone
//
//  Created by Idwall Go Dev 012 on 28/03/22.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
    }
    

    
    // MARK: - Helpers
    func configureNavigation(){
        let status = StatusController()
        let statusStackNavigation =   templateNavigationController(image: UIImage(named: "statusIcon")!, rootViewController: status)
        
        let settings = SettingsController()
        let settingsStackNavigation =   templateNavigationController(image: UIImage(named: "setttingsIcon")!, rootViewController: settings)

        
        let calls = CallsController()
        let callsStackNavigation =   templateNavigationController(image: UIImage(named: "callsIcon")!, rootViewController: calls)

        
        let camera = CameraController()
        let cameraStackNavigation =   templateNavigationController(image: UIImage(named: "cameraIcon")!, rootViewController: camera)

        
        let chats = ChatsController()
        let chatsStackNavigation =   templateNavigationController(image: UIImage(named: "conversationIcon")!, rootViewController: chats)
        
        viewControllers = [chatsStackNavigation,statusStackNavigation,callsStackNavigation, cameraStackNavigation,settingsStackNavigation]


    }
   
    
    func templateNavigationController(image:UIImage?, rootViewController: UIViewController)->UINavigationController{
           let navigation = UINavigationController(rootViewController: rootViewController)
           
           let standardAppearance = UINavigationBarAppearance()
           standardAppearance.configureWithOpaqueBackground()
           standardAppearance.backgroundColor = .white
        
           navigation.tabBarItem.image = image
           navigation.navigationBar.standardAppearance = standardAppearance
           navigation.navigationBar.compactAppearance = standardAppearance
           navigation.navigationBar.scrollEdgeAppearance = standardAppearance
           
           return navigation
       }

}
