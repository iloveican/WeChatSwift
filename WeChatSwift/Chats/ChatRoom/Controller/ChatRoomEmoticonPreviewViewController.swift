//
//  ChatRoomEmoticonPreviewViewController.swift
//  WeChatSwift
//
//  Created by xu.shuifeng on 2019/7/26.
//  Copyright © 2019 alexiscn. All rights reserved.
//

import UIKit
import FLAnimatedImage
import WXActionSheet

class ChatRoomEmoticonPreviewViewController: UIViewController {

    private var animatedImageView: FLAnimatedImageView!
    
    private let emoticonMsg: EmoticonMessage
    
    init(emoticon: EmoticonMessage) {
        self.emoticonMsg = emoticon
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupNavigationBar()
        setupAnimatedImageView()
    }
    
    private func setupNavigationBar() {
        let moreButtonItem = UIBarButtonItem(image: UIImage.SVGImage(named: "icons_filled_more"), style: .done, target: self, action: #selector(moreButtonClicked))
        navigationItem.rightBarButtonItem = moreButtonItem
    }
    
    private func setupAnimatedImageView() {
        animatedImageView = FLAnimatedImageView(frame: CGRect(x: 0, y: 0, width: 192, height: 192))
        view.addSubview(animatedImageView)
        animatedImageView.pin_setImage(from: emoticonMsg.url)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        animatedImageView.center = CGPoint(x: view.center.x, y: view.center.y - 45)
    }
 
    @objc private func moreButtonClicked() {
        let actionSheet = WXActionSheet(cancelButtonTitle: "取消")
        actionSheet.add(WXActionSheetItem(title: "投诉", handler: { _ in
            
        }))
        actionSheet.add(WXActionSheetItem(title: "跟拍", handler: { _ in
            
        }))
        actionSheet.add(WXActionSheetItem(title: "发送给朋友", handler: { _ in
            
        }))
        actionSheet.add(WXActionSheetItem(title: "添加到表情", handler: { _ in
            
        }))
        actionSheet.show()
    }

}