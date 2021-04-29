//
//  LauncherViewController.swift
//  Asses Me
//
//  Created by Fahmi Dzulqarnain on 28/04/21.
//

import UIKit

class LauncherViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    let firstRun = UserDefaults.standard.bool(forKey: "firstRun") as Bool
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.backgroundColor = UIColor.clear
        let backgroundLayer = Colors().gl
        backgroundLayer.frame = view.frame
        mainView.layer.insertSublayer(backgroundLayer, at: 0)
        
        viewDidAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        
        if firstRun {
            let viewController = storyboard.instantiateViewController(withIdentifier: "HomeView") as! MainPageViewController;
            viewController.modalTransitionStyle = .crossDissolve
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
        } else {
            runFirst()
        }
    }
    
    func runFirst() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let viewController = storyboard.instantiateViewController(withIdentifier: "Onboarding") as! OnboardingViewController;
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
        UserDefaults.standard.set(true, forKey: "firstRun")
    }
    
}
