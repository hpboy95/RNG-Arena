//
//  MenuController.swift
//  RNG Arena
//
//  Created by David on 11/25/16.
//  Copyright © 2016 Hezekiah Valdez. All rights reserved.
//

import UIKit

class MenuController: UIViewController {

    var score = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //authPlayer()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    
    @IBAction func highScore(_ sender: UIButton) {
    }
    
    /** GameCenter Stuff
    func authPlayer() {
        let localPlayer = GKLocalPlayer.localPlayer()
        
        localPlayer.authenticateHandler = {
            (view, error) in
            
            if view != nil {
                self.present(view!, animated: true, completion:nil)
            }
            else {
                print(GKLocalPlayer.localPlayer().isAuthenticated)
            }
        }
    }
    
    func setScore(s: Int) {
        score = s
    }
    
    func saveHighScore (s : Int) {
        if GKLocalPlayer.localPlayer().isAuthenticated {
            
        }
    }
 */
    
}
