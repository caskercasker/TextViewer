//
//  SecondViewController.swift
//  TextViewer
//
//  Created by 조우현 on 2022/09/27.
//

import UIKit


class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let label = ["1","2","3","4","5"]
    var list : [String] = []

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TxtTableViewCell
        //let cell = tableView.dequeueReusableCell(withIdentifier: "TxtTableViewCell") as! TxtTableViewCell
        cell.SecondView?.text = list[indexPath.row]
        //assert(cell.loadingTxtFile == nil, "button is nil")
        //assert(cell.SecondView == nil, "label is nil")
       
        print(label[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 105
        }
 //    var sendDelegate : SendDelegate?
    
    @IBOutlet weak var ShowTxtFiles: UITableView!
    
    @IBAction func loadingTxtFile(_ sender: Any) {
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
    
    // MARK: Select which txt filed will be shown
//    @IBAction func loadingTxtFiles(_ sender: Any) {
//        print("파일명을 보냄")
//        var textname = "sample2.txt"
//        //sendDelegate?.sendLoadingFiles(text: textname )
//        //print(textname)
//        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
//        vc.txtname = textname
//        print(vc.txtname)
//        //viewWillAppear(true)
//        self.present(vc, animated: true, completion: nil)
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.ShowTxtFiles.register(TxtTableViewCell.self, forCellReuseIdentifier: "TxtTableViewCell")
        //ShowTxtFiles.register(TxtTableViewCell.self, forCellReuseIdentifier: "TxtTableViewCell")
        //tblMissions.register(UINib(nibName: "MissionCell", bundle: nil), forCellReuseIdentifier: "MissionCell")
        //self.SecondView.text = "PPAP"
        // Do any additional setup after loading the view.
//        
//        let myNewView=UIView(frame: CGRect(x: 10, y: 100, width: 300, height: 200))
//        myNewView.backgroundColor=UIColor.red
//        self.view.addSubview(myNewView)
        
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
        //var list : [String] = []
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
        print(list.count)
        //self.SecondView.text = list[2]
        
        
        ShowTxtFiles.delegate = self
        ShowTxtFiles.dataSource = self

                
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touch accepcted")
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
