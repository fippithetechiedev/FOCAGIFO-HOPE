//
//  startViewController.swift
//  FOCAGIFO
//
//  Created by Philip George on 14/10/17.
//  Copyright © 2017 Philip George. All rights reserved.
//

import UIKit
import Alamofire
import Canvas
import FirebaseDatabase

var downflag = 0
var request = "" //stores corresponding key for user's request
var val:NSDictionary?

var width:CGFloat = 0
var height:CGFloat = 0
var flag = 0
var img = ["7","8","9","10","11","12","13","14","15"] //images

//var cont = ""
//var content:NSString = ""
class startViewController: UIViewController {
    
    //database reference
    var ref:DatabaseReference!

    
    //declaring various configs to position slideshow.
    let se = CGPoint(x: 120.0, y: 64.0)
    let sevenplus = CGPoint(x: 167.1, y: 83.3)
    let seven = CGPoint(x: 147.5, y: 76.0)
    let fours = CGPoint(x: 120.0, y: 53.5)
    
    var time = 0
    var index = 0
    var timeee = 0
    var counter = 0
    
    @IBAction func slideshowpressed(_ sender: Any) {
    
        myview.type = "fadeOut"
        myview.duration = 1
        myview.delay = 0
        myview.startCanvasAnimation()
        //sSwiftTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startViewController.timee), userInfo: nil, repeats: true)
        //SwiftTimer.fire()
        SwiftTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(startViewController.timer), userInfo: nil, repeats: true)
    }
    
    
    @IBOutlet weak var uimg: UIImageView!
    
    
    @IBAction func infopress(_ sender: Any) {
        
        createalert(title: "HELP", message: "1. Swipe right for menu.\n 2. To read a new verse, press the 'Refresh' button.\n 3. Press the 'Slideshow' button for image slideshow.\n\n App designed and developed by Philip George.(fippithetechiedev@gmail.com)")
        
        
        //UserDefaults.standard.set(0, forKey: "Flag")
        //print("RESET")
        
    }
    
    //typealias Downloadcomplete = () -> ()
    
    @IBOutlet weak var slideshow: UIButton!
    @IBOutlet weak var alphaview: UIView!
    
    @IBOutlet weak var main: UIView!
    @IBOutlet weak var clickhere: UILabel!
    @IBOutlet weak var myview: CSAnimationView!
    
    @IBOutlet weak var anim3rd: CSAnimationView!
    
    @IBOutlet weak var imganim: CSAnimationView!
    @IBOutlet weak var welcome: UIImageView!
    @IBOutlet weak var anim2nd: CSAnimationView!
    @IBOutlet weak var animview: CSAnimationView!
    
    //refresh verse.
    @IBAction func cardpressed(_ sender: UIButton) {
        verse.text = ""
        reference.text = ""
        downloadverse()
    }
    
    //various timers declared.
    var SwiftTimer = Timer()
    var sSwiftTimer = Timer()
    var checktimer = Timer()
    var cchecktimer = Timer()
    
    
    //Walkthrough.
    @IBAction func howtopressed(_ sender: UIButton) {
        main.isUserInteractionEnabled = false
        myview.type = "fadeOut"
        myview.delay = 0
        myview.duration = 0.3
        myview.startCanvasAnimation()
        myview.isUserInteractionEnabled = false
        walkthrough()
        
        //check()
        checktimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startViewController.check), userInfo: nil, repeats: true)
        
        
    }
    
    
    @IBOutlet weak var howto: UIButton!
    @IBOutlet weak var card: UIButton!
    @IBOutlet weak var progress: UIActivityIndicatorView!
    @IBOutlet weak var reference: UILabel!
    @IBOutlet weak var menyo: UIButton!
    
    
 
   
    
    @IBOutlet weak var projects: UIButton!
    
    @IBOutlet weak var involved: UIButton!
    @IBOutlet weak var contact: UIButton!
    
    @IBOutlet weak var verse: UITextView!
    
    @IBOutlet weak var home: UIButton!
    
    
    @IBAction func homepressed(_ sender: UIButton) {
        
        print("end")
        UIView.animate(withDuration: 0.5) {
            
            self.main.transform = CGAffineTransform(translationX: -width, y: 0)
            //self.close.transform = CGAffineTransform(translationX: 115, y: 0)
        }
        self.close.isEnabled = false
        UIView.animate(withDuration: 0.1, animations: {
            
            self.alphaview.alpha = 0
            self.close.alpha = 0
        })

    }
   
  
    @IBOutlet weak var our: UIButton!
    
    @IBAction func ourmission(_ sender: UIButton) {
        request = "mission"
        performSegue(withIdentifier: "hometoour", sender: self)
        SwiftTimer.invalidate()
        //print(index.hashValue)
        //time =
        print("TIMER INVALID")
    }
    
    @IBOutlet weak var about: UIButton!
    
    @IBAction func aboutus(_ sender: UIButton) {
        request = "about"
        performSegue(withIdentifier: "hometoour", sender: self)
        SwiftTimer.invalidate()
        print("TIMER INVALID")
    }
    
    @IBAction func projectspressed(_ sender: Any) {
        request = "projects"
        performSegue(withIdentifier: "hometoour", sender: self)
        SwiftTimer.invalidate()
        print("TIMER INVALID")
    }
    
    
    @IBAction func getinvolved(_ sender: Any) {
        request = "involved"
        performSegue(withIdentifier: "hometoour", sender: self)
        SwiftTimer.invalidate()
        print("TIMER INVALID")
    }
    
    @IBAction func contactus(_ sender: Any) {
        request = "contact"
        performSegue(withIdentifier: "hometoour", sender: self)
        SwiftTimer.invalidate()
        print("TIMER INVALID")
    }
    
    @IBAction func right(_ sender: UISwipeGestureRecognizer) {
        print("Right Swipe")
        UIView.animate(withDuration: 0.2) {
            
            self.main.transform = CGAffineTransform(translationX: width, y: 0)
            //self.close.transform = CGAffineTransform(translationX: -115, y: 0)
        }
        self.close.isEnabled = true
        UIView.animate(withDuration: 0.6, animations: {
            self.alphaview.alpha = 1
            self.close.alpha = 0.5
            
            
        })
        
        
    }
    @IBOutlet weak var close: UIButton!
    @IBAction func destructmenu(_ sender: UIButton) {
        print("end")
        UIView.animate(withDuration: 0.5) {
            
            self.main.transform = CGAffineTransform(translationX: -width, y: 0)
            //self.close.transform = CGAffineTransform(translationX: 115, y: 0)
        }
            self.close.isEnabled = false
            UIView.animate(withDuration: 0.1, animations: {
                
                self.alphaview.alpha = 0
                self.close.alpha = 0
            })
            
    }
    
    
    @IBAction func yopressed(_ sender: UIButton) {

        print("begin")
        UIView.animate(withDuration: 0.2) {
            
            self.main.transform = CGAffineTransform(translationX: width, y: 0)
            //self.close.transform = CGAffineTransform(translationX: -115, y: 0)
        }
        self.close.isEnabled = true
            UIView.animate(withDuration: 0.6, animations: {
                
                self.alphaview.alpha = 1
                self.close.alpha = 0.5
            })
            
        
        
    }
    
    
    


    //get random verse and check for active internet connection.
    func downloadverse()
    {
        //var status = 0;
        progress.startAnimating()
        var refe = ""
        
        let downloadurl = URL(string: "https://beta.ourmanna.com/api/v1/get/?format=json&order=random")!
        Alamofire.request(downloadurl).responseJSON
            { response in
                print(response.response?.statusCode ?? 0)
                
                if response.response?.statusCode == 200
                {
                    print("YAY")
                    
                    
                }
                
                else if(response.response?.statusCode != 200)
                {
                    //status = 404
                    print("Internet Connection not Available!")
                    self.smsdeny(title: "Connectivity Error", message: "\n\n\n\n\n\n\n\n\n\n\nEnable WIFI or Mobile Data from settings. Use the back arrow to get back to the app.")
                    val = [
                        "donation" : "NO INTERNET CONNECTION",
                        "about" : "NO INTERNET CONNECTION",
                        "contact" : "NO INTERNET CONNECTION",
                        "mission" : "NO INTERNET CONNECTION",
                        "p1" : "NO INTERNET CONNECTION",
                        "p2" : "-",
                        "p3" : "-",
                        "p4" : "-",
                        "p5" : "-",
                        "p6" : "-",
                    ]
                    
                    
                }
                    
                else if(response.response?.statusCode != 200 && downflag == 0)
                {
                    print("oh no")
                    
                    val = [
                        "about" : "NO INTERNET CONNECTION",
                        "contact" : "NO INTERNET CONNECTION",
                        "mission" : "NO INTERNET CONNECTION",
                        "p1" : "NO INTERNET CONNECTION",
                        "p2" : "-",
                        "p3" : "-",
                        "p4" : "-",
                        "p5" : "-",
                        "p6" : "-",
                    ]
                    
                }
                
            
                
            //print(status)
                
                
                let result = response.result
                //print(result)
                //print(response)
                
               // print("code: \(status ?? 000)")
                if let dict = result.value as? Dictionary<String, AnyObject> {
                 
                    if let resul = dict["verse"] as? Dictionary<String, AnyObject>
                    {
                        //print(resul)
                        //first dictionary
                        
                        if let details = resul["details"] as? Dictionary<String, AnyObject>
                        {
                            //second dictionary
                            //print(details)
                            if let vers = details["text"] as? String
                            {
                                if let ref = details["reference"] as? String{
                                    print(ref)
                                    refe = ref
                                }
                                print(vers)
                                if vers.count > 120
                                {
                                    self.downloadverse()
                                }
                                else
                                {
                                
                                self.progress.stopAnimating()
                                self.reference.text = refe
                                self.verse.text = vers
                                    
                                }
                            }
                        }
                    }
                    
                    
                    
                }
        }
        //completed() //download complete
        //print(VERSE)
     

//        if status == 200
//        {
//            print("Internet Connection Available!")
//            //loading.isHidden = false
//            //loadingl.text = "Loading"
//            ref = Database.database().reference().child("INFO")
//            
//            //let child = "INFO/\(request)"
//            ref.observe(.value, with: { snapshot in
//                if snapshot.exists()
//                {
//                    let value = snapshot.value as? NSDictionary
//                    //self.textdisp.text = value?[request] as? String ?? ""
//                    val = value
//                    //print(val)
//                }
//                
//                
//            })
//            
//        }
//        else if status == 404
//        {
//            print("Internet Connection not Available!")
//            smsdeny(title: "Connectivity Error", message: "Enable WIFI or Mobile Data from settings.")
//            
//            
//            val = [
//                "about" : "NO INTERNET CONNECTION",
//                "contact" : "NO INTERNET CONNECTION",
//                "mission" : "NO INTERNET CONNECTION",
//                "p1" : "NO INTERNET CONNECTION",
//                "p2" : "-",
//                "p3" : "-",
//                "p4" : "-",
//                "p5" : "-",
//                "p6" : "-",
//            ]
//            
//            
//            
//            //view.isUserInteractionEnabled = false
//            //loading.isHidden = true
//            //print("No Internet Connection!")
//            
//            
//            
//        }
//        
    }
    
    //hide status bar.
    override var prefersStatusBarHidden: Bool {
        return true
    }

//    func checkinternet()
//    {
//        
//        let url = URL(string: "www.google.com")
//        print(Alamofire.Request.ValidationResult.self)
//    }

    
    
    
    
    
    
    
    //pull details from firebase.
    func downloaddata()
    {
        print("Internet Connection Available!")
        //loading.isHidden = false
        //loadingl.text = "Loading"
        self.ref = Database.database().reference().child("INFO")
        
        //let child = "INFO/\(request)"
        self.ref.observe(.value, with: { snapshot in
            if snapshot.exists()
            {
                let value = snapshot.value as? NSDictionary
                //self.textdisp.text = value?[request] as? String ?? ""
                val = value
                downflag = 1
                //print(val)
            }
            
            
        })
    }
    
    
    //create internet not available alert.
    func smsdeny(title:String, message:String)
    {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle:UIAlertControllerStyle.alert)
        
        let imgTitle = UIImage(named:"guide.png")
        let imgViewTitle = UIImageView(frame: CGRect(x: 60, y: 52, width: 150  , height: 150))
        imgViewTitle.image = imgTitle
        
        alert.view.addSubview(imgViewTitle)
        
        
        alert.addAction(UIAlertAction(title: "Settings", style: UIAlertActionStyle.default, handler: { (action) in

            if let url = URL(string: "App-Prefs:root=//") {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, completionHandler: .none)
                } else {
                    // Fallback on earlier versions
                }
            }


            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
  /**/
    
    /*HHHHHHHHHHHHHHHHLSDLSFDKFDFJASKDKDADJSAD*//**/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        verse.text = "Please wait..."
        
        
    print(howto.layer.position)
    print(slideshow.layer.position)
    //get width of nav drawer.
    width = main.frame.width
    height = main.frame.height
    
        
        //if SwiftTimer.isValid == true
        //{
            //SwiftTimer.invalidate()
       // }
    
    
    //know if 1st time use.
    if let x = UserDefaults.standard.object(forKey: "Flag") as?Int
    {
        flag = x
        print("\(x)")
        
    }
    

    
    
    //walkthrough not done.
    if flag == 2
    {
        slideshow.isHidden = false
        if width == 207.5
        {
        slideshow.layer.position = se
        }
        //else if width == 268.666666666667
        //{print("entered")
        //    slideshow.layer.position = sevenplus
        //}
        else if width == 243.5
        {
            
            slideshow.layer.position = seven
        }
        else
        {
            slideshow.layer.position = sevenplus
        }
        
        if height == 480
        {
            slideshow.layer.position = fours
        }
        print("HIDDEN")
        howto.isHidden = true
        howto.isUserInteractionEnabled = false
    }
        
    //walkthrough done.
    else
    {
        slideshow.isHidden = true
    }
        print("WIDTH\(main.frame.width)")
    
    
//    ref = Database.database().reference().child("INFO")
//        
//        //let child = "INFO/\(request)"
//        ref.observe(.value, with: { snapshot in
//            if snapshot.exists()
//            {
//                let value = snapshot.value as? NSDictionary
//                //self.textdisp.text = value?[request] as? String ?? ""
//                val = value
//                //print(val)
//            }
//            
//            
//        })
    
    
        home.layer.cornerRadius = 10
        alphaview.alpha = 0
        close.alpha = 0
        our.layer.cornerRadius = 10
        about.layer.cornerRadius = 10
        projects.layer.cornerRadius = 10
        involved.layer.cornerRadius = 10
        contact.layer.cornerRadius = 10
        card.layer.cornerRadius = 10
        welcome.layer.cornerRadius = 10
        uimg.layer.cornerRadius = 10
        clickhere.layer.cornerRadius = 10
        clickhere.alpha = 0
        myview.layer.cornerRadius = 10
        

        
        
    
    
        //menu.frame.origin = CGPoint(x: -207, y: 0)
        
       // sSwiftTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startViewController.timee), userInfo: nil, repeats: true)
        
        animview.startCanvasAnimation()
        anim3rd.startCanvasAnimation()
        anim2nd.startCanvasAnimation()
        
        
        //SwiftTimer.invalidate()
        
        //check walkthrough
        

        
        
        
        
        
        // Do any additional setup after loading the view.
    }

 /**/   override func viewDidAppear(_ animated: Bool) {
    
    
    
    //check internet.
    if downflag == 0
    {
    downloaddata()
    }
    downloadverse()

    
    
    
    //print(myview.center)
    

    //get verse.
    
    
    //print(flag)
    
    
       /* let longpressgestrec = UILongPressGestureRecognizer(target: self, action: #selector(longpress(press:)))
        
        longpressgestrec.minimumPressDuration = 1.0
        longpressgestrec.numberOfTouchesRequired = 1
        imganim.addGestureRecognizer(longpressgestrec)
        */
    
    
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
/**/ func timee()
    {
        
                print(timeee)
        if timeee == 2
        {
        
        SwiftTimer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(startViewController.timer), userInfo: nil, repeats: true)
            sSwiftTimer.invalidate()
            print("main timer invalidate")
        }
        timeee = timeee + 1

        print(timeee)
    }
    

    
    //timer for photo slideshow.
    
 /**/   func timer()
    {
        if time > 100
        {
            
            time = 0
        
            print("sub timer reset")
        }
        
      //  var flag = 0
       // if time != 0|1
        //{
        //print("YO")
            //imganim.type = "fadeOut"
            //imganim.delay = 0
            //imganim.startCanvasAnimation()
        //}
        //else if time == 1
        //{
        
        //}
        //else if time == 2
        //{
         //   flag = 2
        //}
        
        
            
        
        //print(imganim.type)
        
   /**/     if time%2 == 0
        {
            
            
            if index > 8
            {
                index = 0
            }
        
           // UIView.animate(withDuration: 5, animations: {
                //self.uimg.alpha = 0
                //
                
            //})

            if counter%2 == 0
            {
            
             
                self.uimg.image = UIImage(named: img[self.index])
                imganim.type = "fadeInRight"
                imganim.delay = 0
                imganim.startCanvasAnimation()
            }
            else
            {
                self.uimg.image = UIImage(named: img[self.index])
                imganim.type = "fadeInLeft"
                imganim.delay = 0
                imganim.startCanvasAnimation()
                
            }
            
            //UIView.animate(withDuration: 1, animations: {
              //  self.uimg.alpha = 1

            //})
            counter = counter+1
            print(counter)
        }
        else
        {
            //self.uimg.image = UIImage(named: img[self.index])
 
            if counter > 10
            {
                
                counter = 0
                print("counter reset")
            }
            if counter%2 == 0
            {
            imganim.type = "fadeOutRight"
            imganim.delay = 1
            imganim.startCanvasAnimation()
            }
            else
            {
                imganim.type = "fadeOutLeft"
                imganim.delay = 1
                imganim.startCanvasAnimation()
                
            }
            
            index = index+1
        }
        
        //uimg.image = UIImage(named: img[1])
        
        
        if index > 8
            
        {
            index = 0
        }
        
        print("INDEX\(img[index])")
        print("TIME\(time)")
        
        time = time+1
    }
    
    
    
    //walkthrough longpress setup.
 /**/   func walkthrough()
    {
        let longpressgestrec = UILongPressGestureRecognizer(target: self, action: #selector(longpress(press:)))
        
        longpressgestrec.minimumPressDuration = 1.0
        longpressgestrec.numberOfTouchesRequired = 1
        
        imganim.addGestureRecognizer(longpressgestrec)
        uimg.image = UIImage(named: "walk1")
        imganim.delay = 0
        imganim.duration = 0.5
        imganim.type = "fadeInLeft"
        imganim.startCanvasAnimation()
        
        
        
        }
    
    
    //part of walkthrough.
 /**/   func check()
    {
        print(self.main.frame.maxX)
         if self.main.frame.maxX == width && flag == 0
        {
        
        imganim.type = "fadeOut"
        imganim.delay = 0
        imganim.duration = 1
        imganim.startCanvasAnimation()
        flag = 1
       
        UIView.animate(withDuration: 0.2, animations: { 
            self.clickhere.alpha = 1
        })
        
        }
        else if self.main.frame.maxX == -width && flag == 1
         {
        
            UIView.animate(withDuration: 0.2, animations: {
                self.clickhere.alpha = 0
            })
            
            
          //  clickhere.isHidden = true
        uimg.image = UIImage(named: "walk2")
        imganim.type = "fadeInLeft"
        imganim.delay = 0
        imganim.duration = 0.5
        imganim.startCanvasAnimation()
        checktimer.invalidate()
        myview.isUserInteractionEnabled = true
        }
        }
    
    //part of walkthrough.
    func ccheck()
    {
        uimg.image = UIImage(named: "walk3")
        imganim.type = "fadeInLeft"
        imganim.delay = 0
        imganim.duration = 1
        imganim.startCanvasAnimation()
        cchecktimer.invalidate()
    }
    
    
    //part of walkthrough.
  /**/  func longpress(press:UILongPressGestureRecognizer)
    {
        
        if press.state == .began
        {
            //let location = press.location(in: view)
            
            
            print("PRESSED")
            
            if flag == 1
            {
                imganim.type = "fadeOut"
                imganim.delay = 0
                imganim.duration = 1
                imganim.startCanvasAnimation()
                flag = 0
                //ccheck()
                cchecktimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startViewController.ccheck), userInfo: nil, repeats: true)

                
                
                
                
            }
                
            else{
            imganim.type = "fadeOut"
            imganim.duration = 1
            imganim.delay = 0
            imganim.startCanvasAnimation()
                //press.state = .ended
                flag = 2
                UserDefaults.standard.set(flag, forKey: "Flag")
            
            }
            
        }
            
        else if press.state == .ended
        {
            if flag == 2
            {slideshow.isHidden = false

                if width == 207.5
                {
                    slideshow.layer.position = se
                }
               // else if width == 268
                //{print("entered")
                //slideshow.layer.position = sevenplus
                //}
                else if width == 243.5
                {
                    
                    slideshow.layer.position = seven
                }
                else
                {
                    slideshow.layer.position = sevenplus
                }
            
            print("ended")
            createalert(title: "COMPLETED", message: "You have successfully completed the walkthrough")
            main.isUserInteractionEnabled = true
            howto.isUserInteractionEnabled = false
            howto.isHidden = true
            myview.type = "fadeInUp"
            myview.duration = 1
            myview.delay = 1
            myview.startCanvasAnimation()
            
            }
            print(flag)
            
            
        }
        
        
    }
    
    
    //create alert.
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
