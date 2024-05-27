//
//  SceneDelegate.swift
//  Notes
//
//  Created by Aleksandra Nikiforova on 28/01/24.
//

import UIKit
import CocoaLumberjack

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        DDLogDebug("Function: \(#function)")

        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

        let tabBar = UITabBarController()
        let firstTabViewController = FirstTabViewController()
        let navigation = UINavigationController(rootViewController: firstTabViewController)
        navigation.tabBarItem = UITabBarItem(title: "Галерея", image: UIImage(systemName: "square.fill"), selectedImage: nil)
        let secondTabViewController = SecondTabViewController()
        secondTabViewController.tabBarItem = UITabBarItem(title: "Заметки", image: UIImage(systemName: "square.fill"), selectedImage: nil)
        tabBar.viewControllers = [navigation, secondTabViewController]

        window.rootViewController = tabBar
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        DDLogDebug("Function: \(#function)")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        DDLogDebug("Function: \(#function)")
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        DDLogDebug("Function: \(#function)")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        DDLogDebug("Function: \(#function)")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        DDLogDebug("Function: \(#function)")
    }
}
