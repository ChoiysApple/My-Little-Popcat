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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        self.textLabel?.font = UIFont(name: "AvenirNext", size: UIFont.labelFontSize)
        self.textLabel?.textColor = .systemGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Disclosure cell
class SettingsDiscolsureCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        self.textLabel?.font = UIFont(name: "AvenirNext", size: UIFont.labelFontSize)
        self.accessoryType = .disclosureIndicator
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - header view
public func tableViewSectionHeaderView(description: String) -> UIView {
    let descriptionLabel = UILabel()
    descriptionLabel.font = UIFont(name: "AvenirNext-medium", size: 28)
    descriptionLabel.text = description
    descriptionLabel.textAlignment = .left
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

    let contentView = UIView()
    
    contentView.addSubview(descriptionLabel)
    descriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
    descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
    descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
    descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    
    return contentView
}

//MARK: footer view
public func tableViewSectionFooterView(description: String) -> UIView {
    let descriptionLabel = UILabel()
    descriptionLabel.font = UIFont(name: "AvenirNext-regular", size: 15.0)
    descriptionLabel.textColor = .systemGray
    descriptionLabel.text = description
    descriptionLabel.textAlignment = .left
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

    let contentView = UIView()
    contentView.addSubview(descriptionLabel)
    descriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
    descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
    descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
    
    return contentView
}
