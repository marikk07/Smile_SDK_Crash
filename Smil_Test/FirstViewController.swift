//
//  FirstViewController.swift
//  Smil_Test
//
//  Created by Maryan Pasichniak on 26.11.2021.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var conrainerView: UIView!
    
    lazy var pageContainer: UIPageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    
    let vc1 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
    
    let vc2 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SmileViewController") as! SmileViewController
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        conrainerView?.layoutIfNeeded()
        pageContainer.view.frame = conrainerView.bounds
        conrainerView.addSubview(pageContainer.view)
        addChild(pageContainer)
        
        
        vc1.nextAction = { [weak self] in
            self?.nextVC()
        }
        
        vc2.previosAction = { [weak self] in
            self?.previosVC()
        }
        
        
        set(vc1)
    }
    
    func set(_ controller: UIViewController, direction: UIPageViewController.NavigationDirection = .forward, animated: Bool = true, completion: ((Bool) -> ())? = nil) {
        DispatchQueue.main.async {
            controller.modalPresentationStyle = .fullScreen
            self.pageContainer.set(controller, direction: direction, animated: animated, completion: completion)
        }
    }
    
    func nextVC() {
        set(vc2)
    }
    
    func previosVC() {
        set(vc1)
    }
}


extension UIPageViewController {
    func set(_ controller: UIViewController, direction: UIPageViewController.NavigationDirection = .forward, animated: Bool = true, completion: ((Bool) -> ())? = nil) {
        setViewControllers([controller], direction: direction, animated: animated)
    }
}
