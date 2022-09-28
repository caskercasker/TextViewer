//
//  ViewController.swift
//  TextViewer
//
//  Created by 조우현 on 2022/09/26.
//
import Foundation
import UIKit
import SwiftUI

class ViewController: UIViewController, UITextFieldDelegate {

    var txtname: String? = ""
    
    @IBOutlet weak var optionUpperArea: UIView!
    
    @IBOutlet weak var optionBottomArea: UIView!
    func sendLoadingFiles(text: String) {
        txtname = text
        print("현재 여는 파일")
    }
    
    @IBAction func btnaction(_ sender: Any) {
        print("화면이동")
    }
    
    @IBOutlet weak var ShowTxtFiles: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        var cc: Int = 1
        
        var text: String
        super.viewDidLoad()
        
        //self.textView.text = text
        print(txtname)
        print("이름이 온것을 확인")
        txtname = "sample2.txt"
        //print(txtname)
        //txtname = txtname
        text = readTextFile(filename: txtname)
        self.textView.text = text
        //super.viewDidLoad()
        // Do any additional setup after loading the view.
        //TextField.delegate = self // set delegate
        
        let manager  = FileManager.default
        
        guard let url = manager.urls(
                for: .documentDirectory,
                in: .userDomainMask)
            .first else {
            return
        }
        
        self.optionUpperArea.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
        self.optionBottomArea.backgroundColor =
            UIColor.gray.withAlphaComponent(0.8)
            //print(url.path)
        //viewWillAppear(true)
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
//
//    func loadTxtname(){
//        if let name = txtname{
//
//        }
//    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("새로운뷰가 나타남")
    }

    // MARK: - Filemanager, upload the txt file

}

