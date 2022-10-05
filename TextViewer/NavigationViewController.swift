//
//  NavigationViewController.swift
//  TextViewer
//
//  Created by 조우현 on 2022/10/05.
//

import UIKit

class NavigationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
      
    }
    @IBAction func didTpaButton(){
        let vc = UIViewController()
        vc.view.backgroundColor = .systemPink
        
        navigationController?.pushViewController(vc, animated: true )
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
