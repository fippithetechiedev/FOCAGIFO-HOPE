//
//  infoViewController.swift
//  FOCAGIFO
//
//  Created by Philip George on 26/12/17.
//  Copyright © 2017 Philip George. All rights reserved.
//

import UIKit

class infoViewController: UIViewController {
    @IBOutlet weak var back: UIButton!

    var projecttext:[String] = ["A black tea grown in partnership with the Uganda Tea Development Agency and various individuals. Currently, the tea is exported to Thistle Farms, an American organization based in Tennessee.","Key Objectives:\n\n1.To provide holistic technical knowledge and vocational skills to OVC and Youths, who can bring about positive change to their families and communities.\n2. To support the national development efforts through creation of employment opportunities and generation of social business enterprises for self-sustenance.\n3. To create a stimulus for rapid socio-economic transformation of the area and neighboring communities.\n4. To put in place structures, systems, and organs to realize HUS objectives.","","","",""]
    @IBOutlet weak var textfill: UITextView!
    @IBOutlet weak var textback: UIImageView!
    @IBOutlet weak var bagr: UIImageView!
    @IBOutlet weak var contenlabl: UILabel!
    @IBAction func backpressed(_ sender: Any) {
    
        request = "projects"    
        performSegue(withIdentifier: "backshow", sender: self)

    
    }
    @IBAction func info(_ sender: Any) {
        createalert(title: "HELP", message: "1. Swipe right to get to previous screen.\n 2. To read a new verse, press the 'Refresh' button.\n 3. Press the 'Slideshow' button for image slideshow.\n\n App designed and developed by Philip George (fippithetechiedev@gmail.com)")
        
    }
    @IBOutlet weak var info: UIButton!
    
    
    @IBAction func rightswipe(_ sender: UISwipeGestureRecognizer) {
        //print("YO")
        request = "projects"
        performSegue(withIdentifier: "backshow", sender: self)

        
    }
    
    
    
//    if(indexPath == [0,0])
//    {
//    content = "Hope University"
//    }
//    else if(indexPath == [0,1])
//    {
//    content = "Hope Institute"
//    }
//    else if(indexPath == [0,2])
//    {
//    content = "Youth Training and Empowerment"
//    }
//    else if(indexPath == [0,3])
//    {
//    content = "Hiv & Advocacy"
//    }
//    else if(indexPath == [0,4])
//    {
//    content = "Hope Tea"
//
//    }
//    else if(indexPath == [0,5])
//    {
//    content = "Choose Hope Campaign"
//
//    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    
    
    @IBOutlet weak var titlelabl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        if content == "Hope Tea"
        {
            textfill.text = projecttext[0]
        }
        else if content == "Hope University"
        {
            textfill.text = projecttext[1]
            
        }
        else
        {textfill.text = "Coming Soon."
        }
        textback.layer.cornerRadius = 10
        bagr.layer.cornerRadius = 10
        titlelabl.text = "PROJECTS"
        contenlabl.text = content
        back.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func createalert(title:String, message:String)
    {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle:UIAlertControllerStyle.alert)
        
        
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
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
