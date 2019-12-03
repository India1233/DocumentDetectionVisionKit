//
//  ViewController.swift
//  DocumentDetectionVisionKit
//
//  Created by Sachin Dumal on 03/12/19.
//  Copyright © 2019 Sachin Dumal. All rights reserved.
//

import UIKit
import VisionKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpInsideDocument(_ sender: Any) {
        setupDocument()
    }
    private func setupDocument(){
        let documentVC = VNDocumentCameraViewController()
        documentVC.delegate = self
        self.present(documentVC, animated: true, completion: nil)
    }

}


//MARK:- EXTENSION DocumentVC

extension ViewController: VNDocumentCameraViewControllerDelegate {
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        print("Found \(scan.pageCount)")
        
        for i in 0..<scan.pageCount {
            let img = scan.imageOfPage(at: i)
            print(img)
            // ... your code here
        }
    }
}
