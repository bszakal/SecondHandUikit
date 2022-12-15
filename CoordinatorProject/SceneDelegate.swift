//
//  SceneDelegate.swift
//  CoordinatorProject
//
//  Created by Karin Prater on 17.04.22.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var applicationCoordintor: ApplicationCoordinator?
    
    let loginState = LoginState()
    
    @Inject var loginStateUikit: LogginStateUikitProtocol

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let applicationCoordintor = ApplicationCoordinator(window: window, loginState: loginState)
            applicationCoordintor.start()
          
            self.applicationCoordintor = applicationCoordintor
            window.makeKeyAndVisible()
        }
        
    }




}

