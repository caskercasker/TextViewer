//
//  iCloudViewController.swift
//  TextViewer
//
//  Created by 조우현 on 2022/10/10.
//

import UIKit
import MobileCoreServices


class iCloudViewController: UIViewController, UIDocumentPickerDelegate {

    private func documentPicker(controller: UIDocumentPickerViewController, didPickDocumentAtURL url: NSURL){
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let documentPickerController = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF), String(kUTTypeImage), String(kUTTypeMovie), String(kUTTypeVideo), String(kUTTypePlainText), String(kUTTypeMP3)], in: .import)
        documentPickerController.delegate = self
        present(documentPickerController, animated: true, completion: nil)
        print("open icloud")
        // Do any additional setup after loading the view.
        
        let fileManager = FileManager.default
        // Browse your icloud container to find the file you want
        if let icloudFolderURL = fileManager.url(forUbiquityContainerIdentifier: nil)?.appendingPathComponent("Documents"),
        let urls = try? fileManager.contentsOfDirectory(at: icloudFolderURL, includingPropertiesForKeys: nil, options: []) {
          
          // Here select the file url you are interested in (for the exemple we take the first)
          if let myURL = urls.first {
            // We have our url
            var lastPathComponent = myURL.lastPathComponent
            if lastPathComponent.contains(".icloud") {
              // Delete the "." which is at the beginning of the file name
              lastPathComponent.removeFirst()
              let folderPath = myURL.deletingLastPathComponent().path
              let downloadedFilePath = folderPath + "/" + lastPathComponent.replacingOccurrences(of: ".icloud", with: "")
              var isDownloaded = false
              while !isDownloaded {
                if fileManager.fileExists(atPath: downloadedFilePath) {
                  isDownloaded = true
                }
              }
              // Do what you want with your downloaded file at path contains in variable "downloadedFilePath"
            }
          }
        }
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
