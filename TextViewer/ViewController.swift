//
//  ViewController.swift
//  TextViewer
//
//  Created by 조우현 on 2022/09/26.
//
import Foundation
import UIKit
import SwiftUI

class SubView: UIView{
    @IBOutlet weak var OptionButton: UIButton!
    @IBOutlet weak var OpionLabel : UILabel?
    
}
class ViewController: UIViewController, UITextFieldDelegate, NSLayoutManagerDelegate {

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
        super.viewDidLoad()

        var cc: Int = 1
        var text: String
        
        //self.textView.text = text
        print(txtname)
        print("이름이 온것을 확인")
        //txtname = "sample.txt"

        text = readTextFile(filename: txtname)
        self.textView.text = text
        
        let manager  = FileManager.default
        
        guard let url = manager.urls(
                for: .documentDirectory,
                in: .userDomainMask)
            .first else {
            return
        }
        //temporary view tester
        let testview = SubView(frame: CGRect(x: 10, y: 100, width: 300, height: 200))
        testview.backgroundColor = UIColor.red
        //testview.OpionLabel?.text = "ppap"
        //self.view.addSubview(testview)
        
        //testview.OptionButton2.text = "PPAP"
        //let myButton  = SubView.optionbuton
        
        //self.view.addSubview(button)
        
        //self.textView.isUserInteractionEnabled = false
        //self.textView.isEditable = false
        
        
        self.optionUpperArea.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
        self.optionBottomArea.backgroundColor =
            UIColor.gray.withAlphaComponent(0.8)
            //print(url.path)
        //viewWillAppear(true)
        //manager.createDirectory(at: , withIntermediateDirectories: true)
        
        //UI view 에 버튼 종속시키기
        
//        let myNewView=UIView(frame: CGRect(x: 10, y: 100, width: 300, height: 200))
//        myNewView.backgroundColor=UIColor.red
//        self.view.addSubview(myNewView)
//        let scrollingView = UIScrollView(frame: CGRect(x: CGFloat(20), y: CGFloat(20), width: CGFloat(view.bounds.size.width - 40), height: CGFloat(view.bounds.size.height - 40)))
//
//            // we will set the contentSize after determining how many pages get filled with text
//            //scrollingView.contentSize = CGSize(width: CGFloat((view.bounds.size.width - 20) * pageNumber), height: CGFloat(view.bounds.size.height - 20))
//
//            scrollingView.isPagingEnabled = true
//            view.addSubview(scrollingView)
//
//            let textString = "NOW, what I want is, Facts.  Teach these boys and girls nothing but Facts.  Facts alone are wanted in life.  Plant nothing else, and root out everything else.  You can only form the minds of reasoning animals upon Facts: nothing else will ever be of any service to them.  This is the principle on which I bring up my own children, and this is the principle on which I bring up these children.  Stick to Facts, sir!’ The scene was a plain, bare, monotonous vault of a school-room, and the speaker’s square forefinger emphasized his observations by underscoring every sentence with a line on the schoolmaster’s sleeve.  The emphasis was helped by the speaker’s square wall of a forehead, which had his eyebrows for its base, while his eyes found commodious cellarage in two dark caves, overshadowed by the wall.  The emphasis was helped by the speaker’s mouth, which was wide, thin, and hard set.  The emphasis was helped by the speaker’s voice, which was inflexible, dry, and dictatorial.  The emphasis was helped by the speaker’s hair, which bristled on the skirts of his bald head, a plantation of firs to keep the wind from its shining surface, all covered with knobs, like the crust of a plum pie, as if the head had scarcely warehouse-room for the hard facts stored inside.  The speaker’s obstinate carriage, square coat, square legs, square shoulders,—nay, his very neckcloth, trained to take him by the throat with an unaccommodating grasp, like a stubborn fact, as it was,—all helped the emphasis. ‘In this life, we want nothing but Facts, sir; nothing but Facts!’ The speaker, and the schoolmaster, and the third grown person present, all backed a little, and swept with their eyes the inclined plane of little vessels then and there arranged in order, ready to have imperial gallons of facts poured into them until they were full to the brim."
//
//            let textStorage = NSTextStorage(string: textString)
//            let textLayout = NSLayoutManager()
//            textStorage.addLayoutManager(textLayout)
//            textLayout.delegate = self
//
//            var r = CGRect(x: 0, y: 0, width: scrollingView.frame.size.width, height: scrollingView.frame.size.height)
//
//            var i: Int = 0
//
//            // this is what we'll use to track the "progress" of filling the "screens of textviews"
//            // each time through, we'll get the last Glyph rendered...
//            // if it's equal to the total number of Glyphs, we know we're done
//            var lastRenderedGlyph = 0
//
//            while lastRenderedGlyph < textLayout.numberOfGlyphs {
//
//                let textContainer = NSTextContainer(size: scrollingView.frame.size)
//                textLayout.addTextContainer(textContainer)
//
//                let textView = UITextView(frame: r, textContainer: textContainer)
//
//                r.origin.x += r.width
//
//                textView.font = .systemFont(ofSize: 25)
//
//                textView.tag = i
//
//                i += 1
//
//                scrollingView.addSubview(textView)
//
//                // get the last Glyph rendered into the current textContainer
//                lastRenderedGlyph = NSMaxRange(textLayout.glyphRange(for: textContainer))
//
//            }
//
//            // use the last textView rect to set contentSize
//            scrollingView.contentSize = CGSize(width: r.origin.x, height: r.size.height)
//
//            print("Actual number of pages =", i)
        
        

    }
    
    // MARK: - text field seeting
    func textField(textField: UITextField, shouldChangeCharactersInRange range:NSRange,replacementString string: String) -> Bool
    {
        let maxLength = 10
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        
        return newString.count <= maxLength
    }
    
    // MARK: Read text file
    func readTextFile(filename : String?) -> String {
        var result:String = ""
        //let paths = Bundle.main.path(forResource: filename, ofType: nil)
        
        let manager = FileManager.default
        let url  = manager.urls(
            for: .documentDirectory,
            in: .userDomainMask)
            .first
        //let paths =
        //print(url?.path())
        
        //let paths = url?.absoluteString
        //print(paths)
        guard url != nil else {return "fatal"}
        
        do{
            let helloPath = url!.appendingPathComponent(filename!)
            result = try String(contentsOf: helloPath, encoding: .utf8)
        }
        catch let error as NSError{
            print("open failure")
            return "failure"
        }
        //print("open success")
        //print(result)
        return result
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("새로운뷰가 나타남")
    }
    
    var count : Int = 0

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touch accepcted")
        count += 1

        if count%2 == 0{
            self.optionUpperArea.backgroundColor = UIColor.gray.withAlphaComponent(0)
            //self.optionBottomArea.backgroundColor = UIColor.gray.withAlphaComponent(0)
            //self.optionBottomArea.removeFromSuperview()
            self.optionBottomArea.isHidden = true

        } else {
            self.optionUpperArea.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
            //self.optionBottomArea.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
            self.optionBottomArea.isHidden = false

        }
        //self.optionUpperArea.backgroundColor = UIColor.gray.withAlphaComponent(0)
        print(count/2)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touch end")
    }

    // MARK: - Filemanager, upload the txt file

}

