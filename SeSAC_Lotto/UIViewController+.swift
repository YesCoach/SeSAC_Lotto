//
//  UIViewController+.swift
//  SeSAC_Lotto
//
//  Created by 박태현 on 2023/09/13.
//

import UIKit.UIViewController

extension UIViewController {

    func presentAlert(title: String?, message: String?) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        let alertAction = UIAlertAction(title: "확인", style: .default)

        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }

}
