//
//  ViewController.swift
//  TextViewer
//
//  Created by 조우현 on 2022/09/26.
//
import Foundation
import UIKit
import SwiftUI
protocol SendDelegate{
    func sendLoadingFiles (text: String)
    func ppap()
}
class ViewController: UIViewController, UITextFieldDelegate,SendDelegate {
    func ppap() {
        print("bob")
    }
    //var sendDelegate : SendDelegate!
   
    var a: String? = ""
    
    func sendLoadingFiles(text: String) {
        print("읽고싶은 파일 호출")
        print("aa")
        print(text)
        print("bb")
        a = text
    }
    //set delegate to class
    @IBAction func btnaction(_ sender: Any) {
        print("화면이동")
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        //self.present(secondVC, animated:true, completion: nil)
        //let secondVC =
        secondVC.sendDelegate = self
        print("델리게이트 전달")
        //secondVC?.modalTransitionStyle = .formSheet
        //self.present(secondVC ?? <#default value#>, animated: true)
    }
    
    @IBOutlet weak var ShowTxtFiles: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        var cc: Int = 1
        var text: String
//        text = """
//        The powerful programming language that is also easy to learn.Swift is a powerfulnd intuitive programming language for iOS, iPadOS, macOS, tvOS, and watchOS. Writing Swift code is interactive and fun, the syntax is concise yet expressive, and Swift includes modern features developers love. Swift code is safe by design and produces software that runs lightning-fast.
//        Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.
//        """
        //self.uiTitle.text = text
        //self.textView.text = text
        a = "sample.txt"
        print(a)
        text = readTextFile(filename: a)
        self.textView.text = text
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //TextField.delegate = self // set delegate
        
        let manager  = FileManager.default
        
        guard let url = manager.urls(
                for: .documentDirectory,
                in: .userDomainMask)
            .first else {
            return
            
            
        }
            //print(url.path)
        
        //manager.createDirectory(at: , withIntermediateDirectories: true)
    }
    
    // MARK: - read txt file
    func textField(textField: UITextField, shouldChangeCharactersInRange range:NSRange,replacementString string: String) -> Bool
    {
        let maxLength = 10
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        
        return newString.count <= maxLength
    }
    
    func readTextFile(filename : String?) -> String {
        var result:String = ""
        let paths = Bundle.main.path(forResource: filename, ofType: nil)
        guard paths != nil else {return "fatal"}
        
        do{
            result = try String(contentsOfFile: paths!, encoding: .utf8)
        }
        catch let error as NSError{
            print("open failure")
            return "failure"
        }
        //print("open success")
        //print(result)
        return result
    }
    // MARK: - Filemanager, upload the txt file

}

