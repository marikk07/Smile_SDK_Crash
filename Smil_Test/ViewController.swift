//
//  ViewController.swift
//  Smil_Test
//
//  Created by Maryan Pasichniak on 25.11.2021.
//

import UIKit
import Smile_Identity_SDK


class ViewController: UIViewController {

    @IBOutlet weak var videoPreviewView: VideoPreviewView!
    var captureSelfie : CaptureSelfie?
    
    
    var nextAction: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SelfieCaptureConfig.setMaxFrameTimeout( maxFrameTimeout : 200 )
//        captureSelfie = CaptureSelfie()
//        captureSelfie?.setup(captureSelfieDelegate: self, previewView: videoPreviewView, useFrontCamera: true, doFlashScreenOnShutter: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//            captureSelfie?.start(screenRect: videoPreviewView.bounds, userTag: SmileIDSingleton.DEFAULT_USER_TAG)
        }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        captureSelfie?.stop()
    }
    
    @IBAction func nextScreen(_ sender: Any) {
        nextAction?()
    }
    
}

extension ViewController: CaptureSelfieDelegate {
    func onComplete(previewUIImage: UIImage?) {
        guard let data = previewUIImage?.jpegData(compressionQuality: 0.7) else {
            return
        }
        
        view.isUserInteractionEnabled = false
        nextAction?()
    }
    
    func onError(sidError: SIDError) {
        debugPrint(sidError)
    }
    
    func onFaceStateChanged(faceState: Int) {
        debugPrint(faceState)
    }
}

