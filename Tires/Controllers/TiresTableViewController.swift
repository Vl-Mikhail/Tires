//
//  TiresTableViewController.swift
//  Tires
//
//  Created by Mikhail on 24.09.17.
//  Copyright © 2017 Mikhail. All rights reserved.
//

import UIKit

class TiresTableViewController: UITableViewController {
    
    var tires: [Tire] = [
        Tire(model: "Dunlop", image: "Dunlop", price: 5000, size: "215/70R15", isAdded: false, season: "Зима"),
        Tire(model: "Toyo", image: "Toyo", price: 6000, size: "225/65R18", isAdded: false, season: "Зима"),
        Tire(model: "Goodyear", image: "Goodyear", price: 15000, size: "265/65R17", isAdded: false, season: "Зима"),
        Tire(model: "Nankang", image: "Nankang", price: 13000, size: "195/65R15", isAdded: false, season: "Лето"),
        Tire(model: "Pirelli", image: "Pirelli", price: 7000, size: "235/70R17", isAdded: false, season: "Зима"),
        Tire(model: "Dunlop", image: "Dunlop", price: 8000, size: "215/50R15", isAdded: false, season: "Зима")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tires.count
    }

    
    //Создаем ячейку
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Создаем нашу кастомную ячейку
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        cell.imageCell?.image = UIImage(named: tires[indexPath.row].image)
        //Обрезание краев
        cell.imageCell.layer.cornerRadius = 30.0
        cell.imageCell.clipsToBounds = true
        
        cell.modelLabel?.text = tires[indexPath.row].model
        cell.sizeLabel?.text = tires[indexPath.row].size
        cell.priceLabel?.text = "\(String(tires[indexPath.row].price))Р"
        cell.accessoryType = tires[indexPath.row].isAdded ? .checkmark : .none
        
        return cell
    }
    
//    Реакция на нажатие на ячейку
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let optionMenu = UIAlertController(title: nil, message: "Что вы хотите сделать?", preferredStyle: .actionSheet)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//
//        //Отметка добавления в корзину
//        let isAddedAction = UIAlertAction(title: "Добавляем в корзину", style: .default) { (action: UIAlertAction) in
//            //Принимаем ячейку по indexPath
//            let cell = tableView.cellForRow(at: indexPath)
//            cell?.accessoryType = .checkmark
//            self.tires[indexPath.row].isAdded = true
//        }
//
//        //Удалить из корзины
//        let deleteAddAction = UIAlertAction(title: "Удалить из корзины", style: .default) { (action: UIAlertAction) in
//            //Принимаем ячейку по indexPath
//            let cell = tableView.cellForRow(at: indexPath)
//            cell?.accessoryType = .none
//            self.tires[indexPath.row].isAdded = false
//        }
//
//        //Clouger
//        let callHandler = {
//            (action: UIAlertAction) -> Void in
//            let  alertMessage = UIAlertController(title: "Сервис недоступен", message: "Повторите позже", preferredStyle: .alert)
//            alertMessage.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
//            self.present(alertMessage, animated: true, completion: nil)
//        }
//
//        //Создаем действие набора телефона
//        let callActuon = UIAlertAction(title: "Набрать " + "8(914)000-1122", style: .default, handler: callHandler)
//
//        //Добавили наше действие к меню
//        optionMenu.addAction(cancelAction)
//        optionMenu.addAction(callActuon)
//
//        !tires[indexPath.row].isAdded ? optionMenu.addAction(isAddedAction) : optionMenu.addAction(deleteAddAction)
//
//        //Показать наш контроллер
//        self.present(optionMenu, animated: true, completion: nil)
//    }
    

    // Свайп вправо с одной кнопкой удалить
    /*
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            models.remove(at: indexPath.row)
            sizes.remove(at: indexPath.row)
            prices.remove(at: indexPath.row)
            isAdded.remove(at: indexPath.row)
            
            //Удаление ячейки
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
     */
    
    //Собственная реализация смаха вправо
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Social
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Поделиться") { (action, indexPath) in
            let defaultText = "Рассказать друзьям \(self.tires[indexPath.row].model)"
            //Вывод наш ActivityView c возможностью скопировать
            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Удалить") { (action, indexPath) in
            self.tires.remove(at: indexPath.row)
            
            //Удаление ячейки
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        shareAction.backgroundColor = UIColor.gray
        
        return [deleteAction, shareAction];
    }
    
    //Скрываем наш нав.контроллер при свайпе
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }

    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetail"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! DetailViewController
                destinationController.tire = tires[indexPath.row]
            }
        }
    }
}
