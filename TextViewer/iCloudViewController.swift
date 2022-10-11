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
        print(documentPickerController.directoryURL)

        let driveURL = FileManager.default.url(forUbiquityContainerIdentifier: nil)?.appendingPathComponent("Documents")
          if let unwrappedFU = driveURL {
              print("iCloud available")
              let fileURL = driveURL!.appendingPathComponent("test.txt")
              try? "Hello word".data(using: .utf8)?.write(to: fileURL)
          } else {
              print("iCloud not available")
          }
    }
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        // Available from iOS 8.0 to iOS 11.0
        self.handleFileSelection(inUrl: url)// Here url is document's URL
    }

    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        // Available from iOS 11.0
        self.handleFileSelection(inUrl: urls.first!)  // Here urls is array of URLs
    }

    private func handleFileSelection(inUrl:URL) -> Void {
        do {
         // inUrl is the document's URL
            let data = try Data(contentsOf: inUrl) // Getting file data here
        } catch {
            //Log(message: "document loading error")
            print("document loading error")
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
