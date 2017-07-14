//
//  ReadBibleViewController.swift
//  CCGApp
//
//  Created by Matheus Nishi on 25/06/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit

class ReadBibleViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var fontSize = 17.0
    var fontFamily = "Futura-Medium"
    var isNoturne = false
    
    let fontFamilies = [("Avenir", "Avenir"), ("Futura-Medium", "Futura"), ("HelveticaNeue", "Helvetica Neue"), ("Verdana", "Verdana")]
    
    @IBOutlet weak var bibleTextView: UITextView!
    
    // MARK: Outlets da View de Settings

    @IBOutlet weak var settingsView: UIView!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var sizeLabel: UILabel!
    
    @IBOutlet weak var fontCollectionView: UICollectionView!
    
    @IBOutlet weak var noturneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.noturneButton.layer.borderColor = UIColor.white.cgColor
        self.settingsView.layer.borderColor = UIColor.lightGray.cgColor
        self.fontCollectionView.delegate = self
        self.fontCollectionView.dataSource = self
        self.bibleTextView.scrollRangeToVisible(NSRange(location: 0, length: 1))
        self.bibleTextView.font = UIFont(name: fontFamily, size: CGFloat(fontSize))
        
        let versicles = BibleManager.sharedInstance.getChapter().versicles
        var versiclesString = ""
        for item in versicles! {
            versiclesString = "\(versiclesString)\(item.number!). \(item.body!)\n"
        }
        self.bibleTextView.text = versiclesString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func noturneAction(_ sender: Any) {
        if !isNoturne {
            self.noturneButton.setImage(UIImage(named: "MoonSelected"), for: .normal)
            self.noturneButton.backgroundColor = UIColor(red: 74.0/255.0, green: 140.0/255.0, blue: 223.0/255.0, alpha: 1.0)
            self.bibleTextView.backgroundColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
            self.bibleTextView.textColor = UIColor.white
            self.view.backgroundColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
            isNoturne = true
        } else {
            self.noturneButton.setImage(UIImage(named: "MoonNotSelected"), for: .normal)
            self.noturneButton.backgroundColor = UIColor.white
            self.bibleTextView.backgroundColor = UIColor.white
            self.bibleTextView.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
            self.view.backgroundColor = UIColor.white
            isNoturne = false
        }
    }
    
    //MARK: Metodos UICollectionView
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fontFamilies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fontCell", for: indexPath) as! FontCollectionViewCell
        
        cell.fontNameLabel.font = UIFont(name: fontFamilies[indexPath.item].0, size: 17.0)
        cell.fontNameLabel.text = fontFamilies[indexPath.item].1

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.fontFamily = fontFamilies[indexPath.item].0
        self.bibleTextView.font = UIFont(name: fontFamily, size: CGFloat(fontSize))
    }
    
    @IBAction func fontSliderValueChanged(_ sender: Any) {
        self.fontSize = Double(slider.value)
        self.bibleTextView.font = UIFont(name: fontFamily, size: CGFloat(fontSize))
        self.sizeLabel.text = String(Int(fontSize))
    }
    
    @IBAction func settingsButton(_ sender: Any) {
        if settingsView.alpha == 0 {
            UIView.animate(withDuration: 0.2, animations: {
                self.settingsView.alpha = 1
            })
            
        } else {
            UIView.animate(withDuration: 0.2, animations: {
                self.settingsView.alpha = 0
            })
        }
    }
    
    @IBAction func tapDismissSettingsViewAction(_ sender: Any) {
        if settingsView.alpha == 1 {
            UIView.animate(withDuration: 0.2, animations: {
                self.settingsView.alpha = 0
            })
        }
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
