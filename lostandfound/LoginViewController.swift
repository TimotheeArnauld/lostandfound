import UIKit

import Foundation
import Firebase
import GoogleSignIn
import FBSDKCoreKit
import FBSDKLoginKit

class LoginViewController: UIViewController, GIDSignInUIDelegate {
    @IBOutlet weak var signInFB: FBSDKLoginButton!
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var login__: UIImageView!
    var idImage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        signInButton.style = GIDSignInButtonStyle.wide
        
        login__.isUserInteractionEnabled = true
        let login : UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                  action : #selector(loginWithoutSocial))
        login.numberOfTapsRequired = 2
        login__.addGestureRecognizer(login)
        
        let facebook = NSAttributedString(string: "Continuer avec Facebook")
        self.signInFB.setAttributedTitle(facebook,
                                         for: self.signInFB.state)
        
        var _ = Timer.scheduledTimer(timeInterval: 10.0,
                                     target: self,
                                     selector: #selector(changeBackground),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    func loginWithoutSocial(recognizer : UIGestureRecognizer){
        NSLog("Login without social network: admin")
        self.present(FoundViewController(), animated: true, completion: nil)
    }
    
    @objc func changeBackground(id : Any){
        var to_ : UIImage
        if(idImage == 1){
            to_ = UIImage(named:"Wallpaper_2")!
            idImage = 2
        }else{
            to_ = UIImage(named:"Wallpaper")!
            idImage = 1
        }
        
        UIView.transition(with: self.backgroundImage,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: {self.backgroundImage.image = to_},
                          completion: nil)
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result:
        FBSDKLoginManagerLoginResult!, error: NSError?) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
    }
}
