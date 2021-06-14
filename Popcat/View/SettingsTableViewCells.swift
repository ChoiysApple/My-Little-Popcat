//
//  SettingsVolumeCell.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/05/28.
//

import UIKit

//MARK: Volume Cell
class SettingsVolumeCell: UITableViewCell {

    lazy var volumeSlider: UISlider = {
        let volumeSlider = UISlider()
        volumeSlider.minimumValueImage = UIImage(systemName: "speaker.fill")
        volumeSlider.maximumValueImage = UIImage(systemName: "speaker.wave.3.fill")
        volumeSlider.translatesAutoresizingMaskIntoConstraints = false
        
        let currentVolume = UserDataManager().getPopSoundVolume()
        volumeSlider.value = currentVolume
        
        volumeSlider.addTarget(self, action: #selector(sliderActionHandler), for: .valueChanged)
        
        return volumeSlider
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.isUserInteractionEnabled = true
        self.contentView.backgroundColor = UIColor.systemGray6
        addSubview(volumeSlider)
        volumeSlider.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        volumeSlider.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        volumeSlider.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func sliderActionHandler(sender: UISlider) {
        let volume = sender.value
        UserDataManager().setPopSoundVolume(volume: volume)
    }
    
}

//MARK: Info Cell
class SettingsInfoOnlyCell: UITableViewCell {
    
    let subLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext", size: UIFont.labelFontSize)
        label.textColor = .systemGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        self.textLabel?.font = UIFont(name: "AvenirNext", size: UIFont.labelFontSize)
        self.textLabel?.textColor = .systemGray
        self.contentView.backgroundColor = UIColor.systemGray6
        
        addSubview(subLabel)
        subLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        subLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Disclosure cell
class SettingsDiscolsureCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = UIColor.systemGray6
        self.textLabel?.font = UIFont(name: "AvenirNext", size: UIFont.labelFontSize)
        
        self.accessoryType = .disclosureIndicator
        self.accessoryView?.backgroundColor = .systemGray6
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
