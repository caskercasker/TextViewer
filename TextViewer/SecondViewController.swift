//
//  SecondViewController.swift
//  TextViewer
//
//  Created by 조우현 on 2022/09/27.
//

import UIKit


class SecondViewController: UIViewController {
 
//    var sendDelegate : SendDelegate?

    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var SecondView: UILabel! //화면 기능 표시
    @IBAction func loadingTxtFiles(_ sender: Any) {
        print("파일명을 보냄")
        var textname = "sample2.txt"
        //sendDelegate?.sendLoadingFiles(text: textname )
        //print(textname)
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        vc.txtname = textname
        print(vc.txtname)
        //viewWillAppear(true)
        self.present(vc, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.SecondView.text = "PPAP"
        // Do any additional setup after loading the view.
        
        let manager  = FileManager.default
        //let listofFiles = FileManager.contentsOfDirectory(<#T##self: FileManager##FileManager#>)
        let exist : Bool
        
        guard let url = manager.urls(
            for: .documentDirectory,
            in: .userDomainMask)
            .first else {
            return
            
        }
        let emptypath : String = "/Users/jouhyeon/Downloads/무제 폴더"
        var list : [String] = []
        //print(url.path)
        //exist = manager.fileExists(atPath: url.path)
        exist = manager.fileExists(atPath: emptypath)
        
        do {
            try
            list = manager.contentsOfDirectory(atPath:url.path)
        }catch{
            print ("handle")
        }

        print(exist)
        do {
            try
                //list = manager.contentsOfDirectory(atPath:emptypath)
                manager.contentsOfDirectory(atPath:url.path)
        } catch{
            print(error)
        }
        if manager.fileExists(atPath:url.path){
            print("exist")
        }else{
            print("none")
        }
        //print(list)
        self.SecondView.text = list[2]
        
 
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
