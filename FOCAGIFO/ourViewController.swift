//
//  ourViewController.swift
//  FOCAGIFO
//
//  Created by Philip George on 20/10/17.
//  Copyright © 2017 Philip George. All rights reserved.
//

import UIKit
import FirebaseDatabase
import SafariServices
var content=""


class ourViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPickerViewDataSource,UIPickerViewDelegate{
    var firstat = ""

    var field = "" //to determine current textfield
    //var status = false
    
    @IBOutlet weak var donatview: UITextView!
    
    @IBOutlet weak var backg: UIImageView!
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var age: UITextField!
    
    @IBOutlet weak var invite: UIButton!
    
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var contribution: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    
    @IBOutlet weak var submit: UIButton!
    
    
    
    @IBOutlet weak var base: UIImageView!
    
    
    @IBAction func invitepressed(_ sender: Any) {
        
        
        let activityvc = UIActivityViewController(activityItems: ["Hey there! Help FOCAGIFO(www.focagifo.net) raise funds for their projects at https://goo.gl/sv2FYa ."], applicationActivities: nil)
        activityvc.popoverPresentationController?.sourceView = self.view
        
        self.present(activityvc, animated: true, completion: nil)
        
        
        
        
    }
    
    @IBAction func namedone(_ sender: Any) {
    }
    
    
    
    @IBAction func agedone(_ sender: Any) {
    }
    
    @IBAction func gendstart(_ sender: Any) {
        field = "gend"

    }
    
    @IBAction func contristart(_ sender: Any) {
        field = "contri"
        print(field)
        
    }

    
    @IBAction func emaildone(_ sender: Any) {
    }
    
    
    
    
    
    func check() //check if all textfields have info.
    {
        
        
        
        
        if(name.text?.isEmpty == true||age.text?.isEmpty == true||gender.text?.isEmpty == true||contribution.text?.isEmpty == true||email.text?.isEmpty == true)
        {
            //status = false
            createalert(title: "Information Missing", message: "Please fill all fields.")
        }
            
        else if(firstat=="n")
        {
         createalert(title: "Connecetivity Error", message: "Not able to contact server")
        }
        else //if (firstat=="y")
        {
            print("All fields filled.")
        
            

            let add = arc4random_uniform(100000)

            let a = String(add) //make auth. key for  database
            var s = "" //final corresp code/key.
            s = name.text! + a
            print(s)
            
            //let index = email.text?.index((email.text?.endIndex)!, offsetBy: -4)
            
           //let mail = email.text?.substring(to: index!)  // Hello

            
            //print(mail)
            ref.child("requests").child(s).child("Name").setValue(name.text)
            
            
            //print("HEY YOLO \(a)")
            
            ref.child("requests").child(s).child("Age").setValue(age.text)
            
            ref.child("requests").child(s).child("Gender").setValue(gender.text)
        
        ref.child("requests").child(s).child("Contribution").setValue(contribution.text)
            
            ref.child("requests").child(s).child("EmailId").setValue(email.text)
            

            createalert(title: "Request Sent!", message: "Hey \(name.text ?? "User"), 'Thank you for taking interest in our organization'. We'll contact you shortly through e-mail.")
            
            name.text = ""
            age.text = ""
            contribution.text = ""
            gender.text = ""
            email.text = ""
            
            
            //status = true
        }
    

    }
    
    
    
    //activate when submit form pressed.
    @IBAction func submitpressed(_ sender: Any) {
        
        //check database connection
        let connectedRef = Database.database().reference(withPath: ".info/connected")
        connectedRef.observe(.value, with: { snapshot in
            if snapshot.value as? Bool ?? false {
                self.firstat = "y"
                print(self.firstat)
                print("Connected")
            } else {
                self.firstat = "n"
                print(self.firstat)
                print("Not connected")
            }
        })

        
        
    check()
        
    
    
    }
    
    
    
    //list of contributions.
    
    let contrib = ["Technical","Linguistic","Study Material","Electronic Gadgets","-","-"]
    
    //list of genders
    let gend = ["MALE","FEMALE"]
    
    
    //number of rollers in pickerview.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //text in each row of pickerview roller.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (field == "contri")
        {
        return contrib[row]
        }
        else
        {
            return gend[row]

        }
    }
    
    //number of rows in pickerview roller.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (field == "contri")
        {
            return contrib.count
        }
        else
        {
            return gend.count
            
        }
        //return contrib.count
    }
    
    //push selected option into respective textfield.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (field == "contri")
        {
            contribution.text = contrib[row]
        }
        else
        {
            gender.text = gend[row]
        }
        //contribution.text = contrib[row]
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var donat: UIButton!
    
    
    //open donation webpage(razoo.com).
    
    
    
    
    
    
    @available(iOS 10.0, *)
    @IBAction func donatte(_ sender: Any) {
        
        donatealert(title: "Alert!", message: "\n\n\n\n\n\n\n\n\n\n\nUse the back arrow to get back to the app.")

        }
    
    //@available(iOS 9.0, *)
    //let svc = SFSafariViewController(url: URL(string: "https://www.razoo.com/story/Zcdr1g")!)
    //self.present(svc,animated: true,completion: nil)
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var seg: UISegmentedControl!
    
    @IBOutlet weak var tabll: UITableView!
    
    //declaring database.
    var ref:DatabaseReference!
    
    @IBOutlet weak var textdisp: UITextView!
    
    
    
    
    @IBAction func menu(_ sender: Any) {
        
        UIView.animate(withDuration: 0.2) {
            
            self.main.transform = CGAffineTransform(translationX: width, y: 0)
            //self.close.transform = CGAffineTransform(translationX: -115, y: 0)
        }
        self.close.isEnabled = true
        UIView.animate(withDuration: 0.6, animations: {
            //self.alphaview.alpha = 1
            self.close.alpha = 0.5
            
            
        })

        
    }
    
    
    
    //segment tab press for cash/kind
    @IBAction func segpressed(_ sender: Any)
    {
    
        
        if seg.selectedSegmentIndex == 0
        {
            submit.isUserInteractionEnabled = false
            submit.isHidden = true
            base.isHidden = true
            
            invite.isHidden = false
            invite.isUserInteractionEnabled = true
            
            donat.isHidden = false
            donat.isUserInteractionEnabled = true
            
            backg.isHidden = false
            donatview.isHidden = false
            donatview.isUserInteractionEnabled = true
            
            name.isHidden = true
            age.isHidden = true
            gender.isHidden = true
            contribution.isHidden = true
            email.isHidden = true
            name.isUserInteractionEnabled = false
            age.isUserInteractionEnabled  = false
            gender.isUserInteractionEnabled = false
            contribution.isUserInteractionEnabled = false
            email.isUserInteractionEnabled = false
            
        }
        else if seg.selectedSegmentIndex == 1
        {
            backg.isHidden = true
            donatview.isHidden = true
            donatview.isUserInteractionEnabled = false
            submit.isUserInteractionEnabled = true
            submit.isHidden = false
            base.isHidden = false
            
            donat.isHidden = true
            donat.isUserInteractionEnabled = false
            
            invite.isHidden = true
            invite.isUserInteractionEnabled = false
            
            name.isHidden = false
            age.isHidden = false
            gender.isHidden = false
            contribution.isHidden = false
            email.isHidden = false
            name.isUserInteractionEnabled = true
            age.isUserInteractionEnabled  = true
            gender.isUserInteractionEnabled = true
            contribution.isUserInteractionEnabled = true
            email.isUserInteractionEnabled = true
            
        }
    
    
    
    
    
    }
    
    
    
    //information alert
    @IBAction func info(_ sender: Any) {
        createalert(title: "HELP", message: "1. Swipe right for menu.\n 2. To read a new verse, press the 'Refresh' button.\n 3. Press the 'Slideshow' button for image slideshow.\n\n App designed and developed by Philip George.(fippithetechiedev@gmail.com)")
        
    }
    
    @IBOutlet weak var textback: UIImageView!

    @IBOutlet weak var home: UIButton!
    @IBOutlet weak var our: UIButton!
    @IBOutlet weak var about: UIButton!
    @IBOutlet weak var projects: UIButton!
    @IBOutlet weak var involve: UIButton!
    @IBOutlet weak var contact: UIButton!
    
    
    @IBAction func homepressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "ourtohome", sender: self)
    }
    
    
    //to hide elements in view.
    func hide()
    {
        backg.isHidden = true
        donatview.isHidden = true
        donatview.isUserInteractionEnabled = false
        
        submit.isUserInteractionEnabled = false
        submit.isHidden = true
        base.isHidden = true
        
        invite.isHidden = true
        invite.isUserInteractionEnabled = false
        
        donat.isHidden = true
        donat.isUserInteractionEnabled = false

        
        tabll.isHidden = true
        tabll.isUserInteractionEnabled = false
        seg.isHidden = true
        seg.isUserInteractionEnabled = false
        name.isHidden = true
        age.isHidden = true
        gender.isHidden = true
        contribution.isHidden = true
        email.isHidden = true
        name.isUserInteractionEnabled = false
        age.isUserInteractionEnabled  = false
        gender.isUserInteractionEnabled = false
        contribution.isUserInteractionEnabled = false
        email.isUserInteractionEnabled = false
        
        
    }
    
    
    
    @IBAction func ourmission(_ sender: UIButton) {
       
        hide()
        request = "mission"
        print("end")
        labl.text = "OUR MISSION"
        pull()
        UIView.animate(withDuration: 0.5) {
            
            self.main.transform = CGAffineTransform(translationX: -width, y: 0)
            //self.close.transform = CGAffineTransform(translationX: 115, y: 0)
        }
        self.close.isEnabled = false
        UIView.animate(withDuration: 0.1, animations: {
            
            //self.alphaview.alpha = 0
            self.close.alpha = 0
        })

        
    }
    
    
    //to store list of projects.
    var list = ["","","","","",""]
    
    //to extract projects from dictionary.
    func proj()
    {
        var counter = ""
        
        for i in 1...6 {
            counter = "p\(i)"
            print(counter)
            list[i-1] = val?.value(forKey: counter) as! String
            print(counter)
        }
        request = ""
    }
    
    
   //create table with rows.
   public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(6)
    }
    
    //create a cell in each row of table.
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont.init(name: "Gill Sans", size: 14.5)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    //table select.
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        if(indexPath == [0,0])
        {
         content = "Hope University"
        }
        else if(indexPath == [0,1])
        {
            content = "Hope Institute"
        }
        else if(indexPath == [0,2])
        {
            content = "Youth Training & Empowerment"
        }
        else if(indexPath == [0,3])
        {
            content = "Hiv & Advocacy"
        }
        else if(indexPath == [0,4])
        {
            content = "Hope Tea"
            
        }
        else if(indexPath == [0,5])
        {
            content = "Choose Hope Campaign"
            
         }
        
    performSegue(withIdentifier: "info", sender: self)
        
    }
    
    
    
    @IBAction func aboutus(_ sender: UIButton) {

        
        hide()
        //textdisp.scrollsToTop = true


        request = "about"
        labl.text = "ABOUT US"
        //textdisp.text = ""
        pull()
        //request = "about"
        print("end")
        UIView.animate(withDuration: 0.5) {
            
            self.main.transform = CGAffineTransform(translationX: -width, y: 0)
            //self.close.transform = CGAffineTransform(translationX: 115, y: 0)
        }
        self.close.isEnabled = false
        UIView.animate(withDuration: 0.1, animations: {
            self.textdisp.setContentOffset(CGPoint.zero, animated: true)
            
            //self.alphaview.alpha = 0
            self.close.alpha = 0
        })

        //performSegue(withIdentifier: "", sender: self)
    }
    
    @IBAction func projectspressed(_ sender: UIButton) {
        hide()
        request = "projects"
        labl.text = "PROJECTS"
        tabll.isHidden = false
        tabll.isUserInteractionEnabled = true
        //textdisp.text = ""
        pull()
        //request = "projects"
        print("end")
        UIView.animate(withDuration: 0.5) {
            
            self.main.transform = CGAffineTransform(translationX: -width, y: 0)
            //self.close.transform = CGAffineTransform(translationX: 115, y: 0)
        }
        self.close.isEnabled = false
        UIView.animate(withDuration: 0.1, animations: {
            
            //self.alphaview.alpha = 0
            self.close.alpha = 0
        })

        //performSegue(withIdentifier: "", sender: self)
    }
    
    @IBAction func getinvolved(_ sender: UIButton) {
        hide()
        
        backg.isHidden = false
        donatview.isHidden = false
        donatview.isUserInteractionEnabled = true
        
        invite.isHidden = false
        invite.isUserInteractionEnabled = true
        donat.isHidden = false
        donat.isUserInteractionEnabled = true
        seg.selectedSegmentIndex = 0
        request = "involved"
        labl.text = "CONTRIBUTE"
        seg.isHidden = false
        seg.isUserInteractionEnabled = true
        pull()
        //textdisp.text = ""
       // request = "involved"
        print("end")
        UIView.animate(withDuration: 0.5) {
            
            self.main.transform = CGAffineTransform(translationX: -width, y: 0)
            //self.close.transform = CGAffineTransform(translationX: 115, y: 0)
        }
        self.close.isEnabled = false
        UIView.animate(withDuration: 0.1, animations: {
            self.donatview.setContentOffset(CGPoint.zero, animated: true)
            
            //self.alphaview.alpha = 0
            self.close.alpha = 0
        })

        //performSegue(withIdentifier: "", sender: self)
    }
    
    @IBAction func contactus(_ sender: UIButton) {
        hide()
        request = "contact"
        labl.text = "CONTACT US"
        pull()
        //textdisp.text = ""
       // request = "contact"
        print("end")
        UIView.animate(withDuration: 0.5) {
            
            self.main.transform = CGAffineTransform(translationX: -width, y: 0)
            //self.close.transform = CGAffineTransform(translationX: 115, y: 0)
        }
        self.close.isEnabled = false
        UIView.animate(withDuration: 0.1, animations: {
            
            //self.alphaview.alpha = 0
            self.close.alpha = 0
        })

        //performSegue(withIdentifier: "", sender: self)
    }
    
    
    
    
    
    /*class mission

    {
        var text = "To reduce the vulnerability of individuals, families and communities living with and or directly affected by HIV and AIDS by defeating SSDDIM and multiplying SAVE working with and through the faith based community."
        
    
    }*/
    
    
    
    
    
    @IBAction func right(_ sender: UISwipeGestureRecognizer) {
    

    
        print("Right Swipe")
        UIView.animate(withDuration: 0.2) {
            
            self.main.transform = CGAffineTransform(translationX: width, y: 0)
            //self.close.transform = CGAffineTransform(translationX: -115, y: 0)
        }
        self.close.isEnabled = true
        UIView.animate(withDuration: 0.6, animations: {
            //self.alphaview.alpha = 1
            self.close.alpha = 0.5
            
            
        })
    
    }

    
    
    @IBOutlet weak var main: UIView!
   
    
    
    @IBAction func destructmenu(_ sender: UIButton) {
        
        print("end")
        UIView.animate(withDuration: 0.5) {
            
            self.main.transform = CGAffineTransform(translationX: -width, y: 0)
            //self.close.transform = CGAffineTransform(translationX: 115, y: 0)
        }
        self.close.isEnabled = false
        UIView.animate(withDuration: 0.1, animations: {
            
            //self.alphaview.alpha = 0
            self.close.alpha = 0
        })

        
        
    }
    
    @IBOutlet weak var close: UIButton!
    
    
    
    @IBOutlet weak var labl: UILabel!
    
    
    //pull respective data from dict.
    func pull()
    {
        
//        ref = Database.database().reference().child("INFO")
//        
//        //let child = "INFO/\(request)"
//        ref.queryOrdered(byChild: request).observe(.value, with: { snapshot in
//            if snapshot.exists()
//            {
//                let value = snapshot.value as? NSDictionary
//                self.textdisp.text = value?[request] as? String ?? ""
//            }
//            
//        })
//
        
                //let value = val.value as? NSDictionary
        if request == "involved"
        {
            self.donatview.text = val?["donation"] as? String ?? ""
            print(self.donatview.text)
            request = ""
            print(request)
        }
                self.textdisp.text = val?[request] as? String ?? ""
                print(self.textdisp.text)
                request = ""
                print(request)
        
        
        
    }
    
    
    
    

    
    //hide status bar.
    override var prefersStatusBarHidden: Bool {
        return true
    }

  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //contribution.keyboardAppearance = UIKeyboardAppearance.alert
        //contibutionpick.isUserInteractionEnabled = false
        //contibutionpick.isHidden = true
        //self.donatview.setContentOffset(CGPoint.zero, animated: true)
        

        donat.layer.cornerRadius = 10
        invite.layer.cornerRadius = 10
        backg.isHidden = true
        donatview.isHidden = true
        donatview.isUserInteractionEnabled = false
        backg.layer.cornerRadius = 10
        
        ref = Database.database().reference()

        invite.isHidden = true
        invite.isUserInteractionEnabled = false
        submit.layer.cornerRadius = 10
        submit.isUserInteractionEnabled = false
        submit.isHidden = true
        base.isHidden = true
        
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.frame.size = CGSize(width: 320, height: 220 )
        //132
        let pickerView2 = UIPickerView()
        pickerView2.delegate = self
        pickerView2.frame.size = CGSize(width: 320, height: 220)
        
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-40.0)
        
        toolBar.barStyle = UIBarStyle.blackTranslucent
        
        toolBar.tintColor = UIColor.white
        
        toolBar.backgroundColor = UIColor.darkGray
        
        
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(ourViewController.donePressed(_:)))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width / 3, height: self.view.frame.size.height))
        
        label.font = UIFont(name: "Helvetica", size: 12)
        
        label.backgroundColor = UIColor.clear
        
        label.textColor = UIColor.white
        
        label.text = "Select one option."
        
        label.textAlignment = NSTextAlignment.justified
        
        let textBtn = UIBarButtonItem(customView: label)
        
        toolBar.setItems([flexSpace,textBtn,flexSpace,doneButton], animated: true)
        
        contribution.inputAccessoryView = toolBar
        gender.inputAccessoryView = toolBar

        
        
        
        
        
        
        contribution.inputView = pickerView
        gender.inputView = pickerView2
        
        
        donat.isHidden = true
        donat.isUserInteractionEnabled = false

        name.isHidden = true
        age.isHidden = true
        gender.isHidden = true
        contribution.isHidden = true
        email.isHidden = true
        name.isUserInteractionEnabled = false
        age.isUserInteractionEnabled  = false
        gender.isUserInteractionEnabled = false
        contribution.isUserInteractionEnabled = false
        email.isUserInteractionEnabled = false
        
        
        seg.isHidden = true
        seg.isUserInteractionEnabled = false
        tabll.isHidden = true
        tabll.isUserInteractionEnabled = false
        
        if request == "mission"
        {
            labl.text = "OUR MISSION"
            //pull()
            //textdisp.text = mission().text
            
        }
        else if request == "about"
        {
            labl.text = "ABOUT US"
            
            /*ref.queryOrdered(byChild: request).observe(.value, with: { snapshot in
                if snapshot.exists()
                {
                    let value = snapshot.value as? NSDictionary
                    self.textdisp.text = value?["about"] as? String ?? ""
                    print(self.textdisp.text)
                    
                }
            })*/
            
            //textdisp.text = ""
        }
        else if request == "projects"
        {
            
            labl.text = "PROJECTS"
            tabll.isHidden = false
            tabll.isUserInteractionEnabled = true
            //proj()
            //textdisp.isHidden = true
            //textdisp.text = ""
        }
        else if request == "involved"
        {
            backg.isHidden = false
            donatview.isHidden = false
            donatview.isUserInteractionEnabled = true
            invite.isHidden = false
            invite.isUserInteractionEnabled = true
            donat.isHidden = false
            donat.isUserInteractionEnabled = true

            seg.selectedSegmentIndex = 0
            labl.text = "CONTRIBUTE"
            seg.isHidden = false
            seg.isUserInteractionEnabled = true
            //textdisp.text = ""
        }
        else if request == "contact"
        {
            labl.text = "CONTACT US"
            //textdisp.text = ""
            
        }
        pull()
        //request = ""
        //print(request)
        close.alpha = 0 
        //labl.layer.cornerRadius = 10
        base.layer.cornerRadius = 10
        home.layer.cornerRadius = 10
        our.layer.cornerRadius = 10
        about.layer.cornerRadius = 10
        projects.layer.cornerRadius = 10
        involve.layer.cornerRadius = 10
        contact.layer.cornerRadius = 10
        textback.layer.cornerRadius = 10
        
        proj()
        //tabll.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
    }

    
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//        print("yolo")
//    }
    
    
    //done button for pickerview pressed.
    func donePressed(_ sender: UIBarButtonItem) {
        //if field == "contrib"
        //{
        contribution.resignFirstResponder()
        //}
        //else
        //{
            gender.resignFirstResponder()
        //}
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Create alerts.
    func createalert(title:String, message:String)
    {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle:UIAlertControllerStyle.alert)
        
        
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }

    @available(iOS 10.0, *)
    func donatealert(title:String, message:String)
    {
        //UIAlertView.addSubview()

        let alert = UIAlertController(title: title, message: message, preferredStyle:UIAlertControllerStyle.alert)
        
        let imgTitle = UIImage(named:"guide.png")
        let imgViewTitle = UIImageView(frame: CGRect(x: 60, y: 52, width: 150  , height: 150))
        imgViewTitle.image = imgTitle
        
        alert.view.addSubview(imgViewTitle)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            UIApplication.shared.open(NSURL(string:"https://www.razoo.com/story/Zcdr1g")! as URL)
            
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
