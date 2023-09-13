//
//  LoginViewController.swift
//  SeSAC_Lotto
//
//  Created by 박태현 on 2023/09/13.
//

import UIKit
import SnapKit
import Then

final class LoginViewController: UIViewController {

    private lazy var nameTextField = UITextField().then {
        $0.placeholder = "이름을 입력하세요"
        $0.textColor = .label
    }

    private lazy var emailTextField = UITextField().then {
        $0.placeholder = "이메일을 입력하세요"
        $0.textColor = .label
    }

    private lazy var passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력하세요"
        $0.textColor = .label
    }

    private lazy var loginButton = UIButton().then {
        $0.backgroundColor = .systemGreen
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        configureUI()
        configureLayout()
    }

    func configureUI() {
        view.backgroundColor = .systemBackground
    }

    func configureLayout() {
        [
            nameTextField, emailTextField, passwordTextField, loginButton
        ].forEach { view.addSubview($0) }

        nameTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(80)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(80)
            $0.height.equalTo(40)
        }

        emailTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(80)
            $0.top.equalTo(nameTextField.snp.bottom).offset(20)
            $0.height.equalTo(40)
        }

        passwordTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(80)
            $0.height.equalTo(40)
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
        }

        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.keyboardLayoutGuide.snp.top).offset(-40)
            $0.height.equalTo(40)
            $0.width.equalTo(120)
        }
    }

}

