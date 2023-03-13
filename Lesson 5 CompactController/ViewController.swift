//
//  ViewController.swift
//  Lesson 5 CompactController
//
//  Created by Константин Лопаткин on 13.03.2023.
//

import UIKit

class ViewController: UIViewController {
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button.setTitle("Show Info", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addAction(UIAction(handler: { _ in
            
            let buttonFrame = self.button.frame
            let popV = PopViewController()
            popV.modalPresentationStyle = .popover
            popV.preferredContentSize = .init(width: 300, height: popV.popHeight)
            let vc = UIPresentationController(presentedViewController: self, presenting: popV)
            if let popoverPresentationController = popV.popoverPresentationController {
                popoverPresentationController.permittedArrowDirections = .up
                popoverPresentationController.sourceView = self.view
                popoverPresentationController.sourceRect = buttonFrame
                popoverPresentationController.delegate = self

                self.present(popV, animated: true, completion: nil)
            }
        }), for: .touchUpInside)
        view.addSubview(button)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        button.frame = .init(x: view.frame.size.width / 4, y: view.frame.size.height / 4, width: 200, height: 60)
    }


}

extension ViewController: UIPopoverPresentationControllerDelegate {

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {

    }

    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
}
