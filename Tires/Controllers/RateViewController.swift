//
//  RateViewController.swift
//  Tires
//
//  Created by Mikhail on 27.09.2017.
//  Copyright © 2017 Mikhail. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    var rating: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        //Выставить размеры нашего эфекта - размер нашего экрана
        blurEffectView.frame = view.bounds
        
        //Добавляем наш эфект поверх нашей картинки
        backgroundImageView.addSubview(blurEffectView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Обработка трех кнопок
    @IBAction func rateSelect(sender: UIButton){
        switch sender.tag {
        case 1:
            rating = "dislike"
        case 2:
            rating = "good"
        case 3:
            rating = "great"
        default:
            break;
        }
        
        //Возрат к окну назад и берем ссобой данные
        performSegue(withIdentifier: "unwindToDetail", sender: sender)
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
