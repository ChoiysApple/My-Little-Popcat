//
//  SettingsVolumeCell.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/05/28.
//

import UIKit

class SettingsVolumeCell: UITableViewCell {

    // MARK: - Properties
    lazy var volumeSlider: UISlider = {
        let volumeSlider = UISlider()
        volumeSlider.minimumValueImage = UIImage(systemName: "speaker.fill")
        volumeSlider.maximumValueImage = UIImage(systemName: "speaker.wave.3.fill")
        volumeSlider.translatesAutoresizingMaskIntoConstraints = false
        volumeSlider.addTarget(self, action: #selector(sliderActionHandler), for: .valueChanged)
        return volumeSlider
    }()
    
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.isUserInteractionEnabled = true
        addSubview(volumeSlider)
        volumeSlider.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        volumeSlider.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        volumeSlider.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - IBAction
    @objc func sliderActionHandler(sender: UISlider) {
        print(sender.value)
    }
    
}
