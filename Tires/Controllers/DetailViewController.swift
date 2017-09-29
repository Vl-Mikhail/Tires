//
//  DetailViewController.swift
//  Tires
//
//  Created by Mikhail on 26.09.2017.
//  Copyright © 2017 Mikhail. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tireImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var rateButton: UIButton!

    var tire = Tire(model: "", image: "", price: 0, size: "", isAdded: false, season: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tireImageView.image = UIImage(named: tire.image)
        rateButton.setImage(UIImage(named: tire.rating), for: UIControlState.normal)
        
        //Смена заголовка
        title = tire.model
        
        //Авто расширение ячейки
        self.tableView.estimatedRowHeight = 36.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Колл-во ячеек
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    //Возрщает саму ячейку для отображения
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomDetailTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Модель"
            cell.valueLabel.text = tire.model
        case 1:
            cell.fieldLabel.text = "Цена"
            cell.valueLabel.text = String(tire.price)
        case 2:
            cell.fieldLabel.text = "Размер"
            cell.valueLabel.text = tire.size
        case 3:
            cell.fieldLabel.text = "Сезон"
            cell.valueLabel.text = tire.season
        case 4:
            cell.fieldLabel.text = "В корзине"
            cell.valueLabel.text = tire.isAdded ? "В корзине" : "Не в корзине"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        return cell;
    }
    
    //Не скрываем наш нав.контроллер при свайпе
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    //
    @IBAction func close(_ segue: UIStoryboardSegue) {
        if let ratingVC = segue.source as? RateViewController {
            if let rating = ratingVC.rating {
                tire.rating = rating
                rateButton.setImage(UIImage(named: rating), for: UIControlState.normal)
            }
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
