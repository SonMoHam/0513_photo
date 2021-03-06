//
//  ViewController.swift
//  0513_photo
//
//  Created by 손대홍 on 2021/05/13.
//

import UIKit
import YPImagePicker

class ViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var profileChangeBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.profileImage.layer.cornerRadius = profileImage.frame.height / 2
        self.profileChangeBtn.layer.cornerRadius = 10
        
        self.profileChangeBtn.addTarget(self, action: #selector(onProfileChangeBtnClicked), for: .touchUpInside)
    }


    // 사진 변경 버튼이 클릭됐을 때
    @objc fileprivate func onProfileChangeBtnClicked() {
        print("ViewController - onProfileChangeBtnClicked() called")
        
        var config = YPImagePickerConfiguration()
        config.screens = [.library]
        // config.screens = [.library, .photo, .video]
        
        let picker = YPImagePicker(configuration: config)
        
        // 사진 선택됐을 때
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
                
                // 사진 이미지 변경
                self.profileImage.image = photo.image
            }
            
            // 사진 선택창 닫기
            picker.dismiss(animated: true, completion: nil)
        }
        
        // 선택창 보여주기
        present(picker, animated: true, completion: nil)

        
    }
}

