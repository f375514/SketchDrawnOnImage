//
//  NextVC.swift
//  ScratchDrawOnImage
//
//  Created by Md. Faysal Ahmed on 29/12/22.
//

import UIKit

class NextVC: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    var imagee: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img.image = imagee!
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func download(_ sender: UIButton) {
        
        UIImageWriteToSavedPhotosAlbum(imagee!, self, #selector(saved), nil)

    }
    
    
    @objc func saved(_ img: UIImage, didFinishSavingWithError error: Error?, contextType: UnsafeRawPointer) {
                
        if error != nil {
            alert(title: "Error!", massage: "Sorry! This image is not saved.", bTitle: "Cancel")
        }else {
            alert(title: "Saved!", massage: "Image saved Successfully.", bTitle: "Ok")
        }
    }
    
    
    func alert(title: String, massage: String, bTitle: String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: bTitle, style: .default, handler: nil))
        present(alert, animated: true)
    }
    
}
