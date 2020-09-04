// Created by Roopa Raman on 4/9/20
// Copyright © 2020 rr. All rights reserved.
// Using Swift 5.0

import UIKit

class HomeViewController: UIViewController {
    var options : [String] = Constants.defaultOptions
    let defaults = UserDefaults.standard
    @IBOutlet weak var addOptionBtn : UIButton!
    @IBOutlet weak var optionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let opt = defaults.array(forKey: Constants.wheelOptionsKey)  {
            options = opt as! [String]
        }
        optionTableView.dataSource = self
        optionTableView.delegate = self
    }

    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == Constants.nextSegue {
            let destinationVC = segue.destination as! WheelViewController
            destinationVC.options = options
        }
    }
    
    
}

extension HomeViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.optionCell, for: indexPath) as! OptionTableViewCell
        cell.configureCell(option: options[indexPath.row], indexPath: indexPath)
        cell.delegate = self
        return cell
    }
}

extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if options.count > 2 {
            if editingStyle == .delete {
                options.remove(at: indexPath.row)
                defaults.set(options, forKey: Constants.wheelOptionsKey)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
}

extension HomeViewController {
    @IBAction func didAddSelect(_ sender: UIButton){
        options.append("Option \(options.count+1)")
        defaults.set(options, forKey: Constants.wheelOptionsKey)
        optionTableView.reloadData()
        
    }
    
    
}

extension HomeViewController : OptionTableViewCellDelegate {
    func didEnterOption(option: String, for indexPath: IndexPath) {
        options[indexPath.row] = option
        defaults.set(options, forKey: Constants.wheelOptionsKey)
    }
    
    
}
