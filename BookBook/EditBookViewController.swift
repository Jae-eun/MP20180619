//
//  EditBookViewController.swift
//  BookBook
//
//  Created by SWUCOMPUTER on 2018. 6. 22..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class EditBookViewController: UIViewController, UITextFieldDelegate,
UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var imgBook: UIImageView!
    @IBOutlet var textTitle: UITextField!
    @IBOutlet var textImportance: UITextField!
    @IBOutlet var textWriter: UITextField!
    @IBOutlet var textPage: UITextField!
    @IBOutlet var pickerCate: UIPickerView!
    
    var selectedEditData: BookData?
    
    // 카메라로 사진을 찍음
    @IBAction func takePicture(_ sender: UIButton) {
        let myPicker = UIImagePickerController()
        myPicker.delegate = self
        myPicker.allowsEditing = true
        myPicker.sourceType = .camera
        self.present(myPicker, animated: true, completion: nil)
    }
    
    // 앨범에서 사진을 고름
    @IBAction func selectPicture(_ sender: UIButton) {
        let myPicker = UIImagePickerController()
        myPicker.delegate = self;
        myPicker.sourceType = .photoLibrary
        self.present(myPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imgBook.image = image
            
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    // 카테고리 선택 - 피커뷰 부분
    let categoryArray: Array<String> = ["소설", "시", "에세이", "인문", "역사", "문화", "자기계발", "경제/경영",
                                        "예술", "여행", "정치" ,"사회", "과학", "IT", "기타"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryArray[row]
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let bookData = selectedEditData else { return }
        textTitle.text = bookData.name
        textWriter.text = bookData.writer
        textImportance.text = bookData.importance
        textPage.text = bookData.pages
        
        var imageName = bookData.image
        if (imageName != "") {
            let urlString = "http://condi.swu.ac.kr/student/T10iphone/booklist/"
            imageName = urlString + imageName
            let url = URL(string: imageName)!
            if let imageData = try? Data(contentsOf: url) {
                imgBook.image = UIImage(data:imageData)
            }
        }
        
        switch bookData.category {
        case "소설":
            self.pickerCate.selectRow(0, inComponent: 0, animated: true)
        case "시":
            self.pickerCate.selectRow(1, inComponent: 0, animated: true)
        case "에세이":
            self.pickerCate.selectRow(2, inComponent: 0, animated: true)
        case "인문":
            self.pickerCate.selectRow(3, inComponent: 0, animated: true)
        case "역사":
            self.pickerCate.selectRow(4, inComponent: 0, animated: true)
        case "문화":
            self.pickerCate.selectRow(5, inComponent: 0, animated: true)
        case "자기계발":
            self.pickerCate.selectRow(6, inComponent: 0, animated: true)
        case "경제/경영":
            self.pickerCate.selectRow(7, inComponent: 0, animated: true)
        case "예술":
            self.pickerCate.selectRow(8, inComponent: 0, animated: true)
        case "여행":
            self.pickerCate.selectRow(9, inComponent: 0, animated: true)
        case "정치":
            self.pickerCate.selectRow(10, inComponent: 0, animated: true)
        case "사회":
            self.pickerCate.selectRow(11, inComponent: 0, animated: true)
        case "과학":
            self.pickerCate.selectRow(12, inComponent: 0, animated: true)
        case "IT":
            self.pickerCate.selectRow(13, inComponent: 0, animated: true)
        default:
            self.pickerCate.selectRow(14, inComponent: 0, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
