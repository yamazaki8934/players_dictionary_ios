//
//  HomeTableViewCell.swift
//  players_dictionary_ios
//
//  Created by 山崎浩毅 on 2019/04/27.
//  Copyright © 2019年 山崎浩毅. All rights reserved.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {
    public var leftTitle: UILabel!
    private var rightIC: UIImageView!
    private var underBar: UILabel!
    
    required public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        contentView.backgroundColor = .white
        selectionStyle = UITableViewCell.SelectionStyle.none
        
        leftTitle = UILabel()
        leftTitle.textAlignment = .left
        leftTitle.textColor = .black
        leftTitle.font = UIFont(name: "NotoSansCJKjp-Regular", size: 16)
        leftTitle.isUserInteractionEnabled = false
        contentView.addSubview(leftTitle)
        
        let image:UIImage = UIImage(named: "ic_forward.png")!
        
        rightIC = UIImageView(image: image)
        rightIC.tintColor = .gray
        rightIC.contentMode = .scaleAspectFill
        rightIC.isUserInteractionEnabled = false
        contentView.addSubview(rightIC)
        
        underBar = UILabel()
        underBar.backgroundColor = .gray
        underBar.isUserInteractionEnabled = false
        contentView.addSubview(underBar)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        leftTitle.frame = CGRect(x: 24.0,
                                 y: 20.5,
                                 width: 255.0,
                                 height: 23.5)
        
        rightIC.frame = CGRect(x: contentView.bounds.width - 20.0 - 24.0,
                               y: 20.5,
                               width: 24.0,
                               height: 24.0)
        
        underBar.frame = CGRect(x: 20.0,
                                y: leftTitle.frame.maxY + 20.0,
                                width: contentView.bounds.size.width - 20.0 - 20.0,
                                height: 0.5)
    }
    
    class func cellHeight() ->CGFloat {
        return 64.5
    }
}
