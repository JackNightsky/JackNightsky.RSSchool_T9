//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Jack
// On: 4.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ItemsNavigationController: UINavigationController, SettingsDrawColor {

    var drawColorHEX: String = "#f3af22"
    var drawStories: Bool = true
    
    func setDrawColor(_ drawColorHEX: String, andDrawStories drawStories: Bool) {
        self.drawColorHEX = drawColorHEX
        self.drawStories = drawStories
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
