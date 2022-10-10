//
//  iCloudViewController.swift
//  TextViewer
//
//  Created by 조우현 on 2022/10/10.
//

import UIKit
import MobileCoreServices


class iCloudViewController: UIViewController, UIDocumentPickerDelegate {

    func documentPicker(controller: UIDocumentPickerViewController, didPickDocumentAtURL url: NSURL){
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let documentPickerController = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF), String(kUTTypeImage), String(kUTTypeMovie), String(kUTTypeVideo), String(kUTTypePlainText), String(kUTTypeMP3)], in: .import)
        documentPickerController.delegate = self
        present(documentPickerController, animated: true, completion: nil)
        print("open icloud")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
