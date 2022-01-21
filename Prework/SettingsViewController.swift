//
//  SettingsViewController.swift
//  Prework
//
//  Created by Chen Hanrui on 2022/1/19.
//
import SwiftUI
import UIKit

class SettingsViewController: UIViewController{
    
    @IBOutlet weak var AppearanceSection: UILabel!
    @IBOutlet weak var nightMode: UILabel!
    @IBOutlet weak var nightModeImage: UIImageView!
    @IBOutlet weak var nightSwitch: UISwitch!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.title = "Settings"
        
        nightSwitch.isOn = false
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        if nightSwitch.isOn {
            view.backgroundColor = UIColor.black
            AppearanceSection.backgroundColor = UIColor.white
            AppearanceSection.textColor = UIColor.black
            nightMode.textColor = UIColor.white
            nightModeImage.image = UIImage(imageLiteralResourceName: "dayMode")
            nightModeImage.backgroundColor = .white
            let appearance = UINavigationBarAppearance()
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.backgroundColor = .black
            navigationItem.standardAppearance = appearance
            navigationItem.scrollEdgeAppearance = appearance
        }else{
            view.backgroundColor = UIColor.white
            AppearanceSection.backgroundColor = .black
            AppearanceSection.textColor = .white
            nightMode.textColor = .black
            nightModeImage.image = UIImage(imageLiteralResourceName: "nightMode")
            nightModeImage.backgroundColor = .white
            let appearance = UINavigationBarAppearance()
            appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
            appearance.backgroundColor = .white
            navigationItem.standardAppearance = appearance
            navigationItem.scrollEdgeAppearance = appearance
        }
        
        
    }

    
}











//struct Section{
//    let title: String
//    let options: [SettingOptionType]
//}
//
//enum SettingOptionType{
//    case staticCell(model:SettingsOption)
//    case switchCell(model:SettingSwitchOption)
//}
//
//struct SettingSwitchOption{
//    let title: String
//    let icon: UIImage?
//    let iconBackgroundColor: UIColor
//    let handler: (()-> Void)
//    var isOn: Bool
//}
//
//struct SettingsOption{
//    let title: String
//    let icon: UIImage?
//    let iconBackgroundColor: UIColor
//    let handler: (() -> Void)
//}
//
//class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//
//    private let tableView: UITableView = {
//        let table = UITableView(frame: .zero, style: .grouped)
//        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
//        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
//
//        return table
//    }()
//
//    var models = [Section]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configure()
//        title = "Settings"
//        view.addSubview(tableView)
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.frame = view.bounds
//    }
//
//    func configure(){
//        models.append(Section(title: "Appearance", options: [
//            .switchCell(model: SettingSwitchOption(title: "Dark Appearance", icon: UIImage(systemName: "person.circle.fill"), iconBackgroundColor: .black, handler: {
//            }, isOn : true)),
//        ]))
//
//        models.append(Section(title: "General", options: [
//            .staticCell(model: SettingsOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink){
//
//            }),
//            .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .systemBlue){
//
//            }),
//            .staticCell(model: SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
//
//            }),
//            .staticCell(model: SettingsOption(title: "iCound", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemGray) {
//
//            })
//        ]))
//
//        models.append(Section(title: "General", options: [
//            .staticCell(model: SettingsOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink){
//
//            }),
//            .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .systemBlue){
//
//            }),
//            .staticCell(model: SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
//
//            }),
//            .staticCell(model: SettingsOption(title: "iCound", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemGray) {
//
//            })
//        ]))
//
//        models.append(Section(title: "General", options: [
//            .staticCell(model: SettingsOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink){
//
//            }),
//            .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .systemBlue){
//
//            }),
//            .staticCell(model: SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
//
//            }),
//            .staticCell(model: SettingsOption(title: "iCound", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemGray) {
//
//            })
//        ]))
//
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let section = models[section]
//        return section.title
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return models.count
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
//        return models[section].options.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let model = models[indexPath.section].options[indexPath.row]
//
//        switch model.self {
//        case .staticCell(let model):
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else{
//                return UITableViewCell()
//            }
//            cell.configure(with: model)
//            return cell
//        case .switchCell(let model):
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath) as? SwitchTableViewCell else{
//                return UITableViewCell()
//            }
//            cell.configure(with: model)
//            return cell
//        }
//    }
//
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        let type = models[indexPath.section].options[indexPath.row]
//        switch type.self {
//        case .staticCell(let model):
//            model.handler()
//        case .switchCell(let model):
//            model.handler()
//        }
//    }
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */

//}
