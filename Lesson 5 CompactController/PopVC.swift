//
//  PopVC.swift
//  Lesson 5 CompactController
//
//  Created by Константин Лопаткин on 13.03.2023.
//

import UIKit
import SwiftUI

class PopViewController: UIViewController {
    var segmented = UISegmentedControl()
    var popHeight: CGFloat = 280
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        
        button.tintColor = .gray
        button.addAction(UIAction(handler: { _ in
            self.dismiss(animated: true)
        }), for: .touchUpInside)

        segmented = UISegmentedControl(items: ["280pt", "150pt"])
        segmented.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        segmented.selectedSegmentIndex = 0
        
        view.addSubview(segmented)
        view.addSubview(button)
        
    }
    
    
    override func viewWillLayoutSubviews() {
        segmented.frame = .init(x: 0, y: view.layoutMargins.top + 20, width: 150, height: 38)
        segmented.center.x = view.center.x
        button.frame = .init(x: view.frame.size.width - 40, y: 20, width: 30, height: 30)
        
    }
    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
            switch (segmented.selectedSegmentIndex) {
            case 0:
                preferredContentSize = .init(width: 300, height: 280)
            case 1:
                preferredContentSize = .init(width: 300, height: 150)
            default:
                break
            }
        }
}

struct PopViewController_Preview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            PopViewController()
        }
    }
}


