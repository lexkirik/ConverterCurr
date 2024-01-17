//
//  ViewController.swift
//  ConverterCurr
//
//  Created by Test on 9.11.23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbrLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var bynLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getResultsButton(_ sender: Any) {
        
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=23d4c40b8b69de1ad68a9333cee9ac50")
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String : Any] {
                                
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double {
                                    self.chfLabel.text = "CHF: \(chf)"
                                }
                                if let gbr = rates["GBP"] as? Double {
                                    self.gbrLabel.text = "GBP: \(gbr)"
                                }
                                if let jpy = rates["JPY"] as? Double {
                                    self.jpyLabel.text = "JPY: \(jpy)"
                                }
                                if let tryy = rates["TRY"] as? Double {
                                    self.tryLabel.text = "TRY: \(tryy)"
                                }
                                if let byn = rates["BYN"] as? Double {
                                    self.bynLabel.text = "BYN: \(byn)"
                                }
                            }
                        }
                    } catch {
                        print("error")
                    }
                }
            }
        }
        
        task.resume()
        
        
        
        
        
    }
    
}

