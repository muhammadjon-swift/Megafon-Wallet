//
//  InternetServiceSelectedItemViewController.swift
//  Mefafon Wallet
//
//  Created by Muhammadjon Loves on 8/25/22.
//

import UIKit

class InternetServiceSelectedItemViewController: UIViewController {

    @IBOutlet weak var numberOrID: UITextField!
    @IBOutlet weak var amountOfMoney: UITextField!
    
    var theCod: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APICaller.shared.fetchState { result in
            switch result {
            case .success(let state):
                print(state.cod)
                self.theCod = state.cod
                
            case .failure(let error):
                print(error)
            }
        }
        numberOrID.becomeFirstResponder()
        setBottomLine(texfield: numberOrID)
        setBottomLine(texfield: amountOfMoney)
        // Do any additional setup after loading the view.
    }
    
    func setBottomLine(texfield: UITextField) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect (x:0, y: texfield.frame.height - 2, width: texfield.frame.width,
        height: 2)
        bottomLine.backgroundColor = UIColor.init(red : 48/255, green: 173/255, blue: 99/255, alpha:
        1).cgColor
//        1Remove border on text field
        texfield.borderStyle = .none
//        Add the line to the text field
        
        texfield.layer.addSublayer(bottomLine)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func payButtonPressed(_ sender: UIButton) {
        numberOrID.resignFirstResponder()
        amountOfMoney.resignFirstResponder()
        if theCod == "400" {
            if (numberOrID.text?.isEmpty)! || (amountOfMoney.text?.isEmpty)!  {
                numberOrID.placeholder = "Type Your Cliends ID"
                amountOfMoney.placeholder = "Type amount of money"
            } else {
                performSegue(withIdentifier: "successSegue", sender: self)
            }
        } else {
            showUIAlert()
        }

    }
    
    func showUIAlert() {
        
        let alert = UIAlertController(title: "Seems to be an Internet Connection Problem", message: "", preferredStyle: .alert)
        present(alert, animated: true) {
            alert.view.superview?.isUserInteractionEnabled = true
            alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTapOutside)))
        }
      

    }
    @objc func dismissOnTapOutside() {
         self.dismiss(animated: true, completion: nil)
      }
    
    
}
