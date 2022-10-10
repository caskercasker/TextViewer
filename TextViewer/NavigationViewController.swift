//
//  NavigationViewController.swift
//  TextViewer
//
//  Created by 조우현 on 2022/10/05.
//

import UIKit
import Foundation




class NavigationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let fileManager = FileManager.default
        let directoryURL = URL(string: "folderPathHere")!

        do {
            let directoryContents = try fileManager.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil, options: [.skipsSubdirectoryDescendants, .skipsHiddenFiles])
            for url in directoryContents {
                let fileName = fileManager.displayName(atPath: url.absoluteString)
                print(fileName)
            }
        } catch let error {
            let directoryName = fileManager.displayName(atPath: directoryURL.absoluteString)
            print("Couldnt get contents of \(directoryName): \(error.localizedDescription)")
        }
        
        ///
      
        
    }
    @IBAction func didTpaButton(){
//        let vc = UIViewController()
//        vc.view.backgroundColor = .systemPink
//
//        navigationController?.pushViewController(vc, animated: true )
//        if let url = URL(string: "itms-apps://itunes.apple.com/app/id1629135515") {
//            UIApplication.shared.open(url)
//        }
        print("open icloud app")
        
        
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
