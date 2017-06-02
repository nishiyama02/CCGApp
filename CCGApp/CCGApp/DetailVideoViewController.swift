//
//  DetailVideoViewController.swift
//  CCGApp
//
//  Created by Matheus Nishi on 02/06/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class DetailVideoViewController: UIViewController {

    @IBOutlet weak var playerYoutube: YTPlayerView!
    @IBOutlet weak var titleVideoLabel: UILabel!
    @IBOutlet weak var descriptionVideoText: UITextView!
    
    var video = Video()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.playerYoutube.load(withVideoId: video.id)
        self.titleVideoLabel.text = video.title
        self.descriptionVideoText.text = video.videoDescription
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
