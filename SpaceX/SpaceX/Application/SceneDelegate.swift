//
//  SceneDelegate.swift
//  SpaceX
//
//  Created by Talha on 17.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewModel = LaunchViewModel(router: LaunchRouter(), launchService: APIService())
        let homeViewController = LaunchViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: homeViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

