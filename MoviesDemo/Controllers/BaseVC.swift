//
//  BaseVC.swift
//  MoviesDemo
//
//  Created by SOWJI on 01/11/20.
//

import UIKit

class BaseVC: UIViewController {
    var currentOverlay : UIView?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func showOverlay() {
        self.hideOverLay()
        // Create the overlay
        let overlay = UIView(frame: self.view.frame)
        overlay.center = self.view.center
        overlay.alpha = 0.5
        overlay.backgroundColor = .gray
        self.view.addSubview(overlay)
        self.view.bringSubviewToFront(overlay)
        self.currentOverlay = overlay
        let loadingIndicator = UIActivityIndicatorView()
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.center = overlay.center
        loadingIndicator.style = .large
        loadingIndicator.startAnimating()
        loadingIndicator.alpha = 1
        self.currentOverlay?.addSubview(loadingIndicator)
    }
    func hideOverLay() {
        if currentOverlay != nil {
            currentOverlay?.removeFromSuperview()
            currentOverlay =  nil
        }
        
    }
}
