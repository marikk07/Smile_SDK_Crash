//
//  SmileViewController.swift
//  Smil_Test
//
//  Created by Maryan Pasichniak on 25.11.2021.
//

import UIKit
import Smile_Identity_SDK

class SmileViewController: UIViewController {
    
    @IBOutlet weak var cardPreviewView: SIDSmartCardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardPreviewView.setup(captureIDCardDelegate: self, userTag: SmileIDSingleton.DEFAULT_USER_TAG)
    }
    
    var previosAction: (() -> ())?
    
    @IBAction func backAction(_ sender: Any) {
        previosAction?()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        debugPrint("viewWillDisappear")
    }
    
    deinit {
        debugPrint("SmileViewController Deinit")
    }
    
}

extension SmileViewController: CaptureIDCardDelegate {
    func onSmartCardViewFrontComplete(previewUIImage: UIImage, faceFound: Bool) {
        debugPrint("onSmartCardViewFrontComplete")
    }
    
    func onSmartCardViewBackComplete(previewUIImage: UIImage) {
        
    }
    
    func onSmartCardViewError(sidError: SIDError) {
        debugPrint("Error: \(sidError)")
    }
    
    func onSmartCardViewClosed() {
        debugPrint("onSmartCardViewClosed")
//        cardPreviewView?.removeFromSuperview()
        
        previosAction?()
    }
    
    
}
