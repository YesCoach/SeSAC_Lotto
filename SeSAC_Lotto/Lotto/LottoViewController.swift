//
//  LottoViewController.swift
//  SeSAC_Lotto
//
//  Created by 박태현 on 2023/09/13.
//

import UIKit

final class LottoViewController: UIViewController {

    private lazy var label1 = UILabel().then {
        $0.text = "1회차 번호:"
    }
    private lazy var label2 = UILabel().then {
        $0.text = "2회차 번호:"
    }
    private lazy var label3 = UILabel().then {
        $0.text = "3회차 번호:"
    }
    private lazy var label4 = UILabel().then {
        $0.text = "4회차 번호:"
    }
    private lazy var label5 = UILabel().then {
        $0.text = "5회차 번호:"
    }
    private lazy var label6 = UILabel().then {
        $0.text = "6회차 번호:"
    }
    private lazy var label7 = UILabel().then {
        $0.text = "7회차 번호:"
    }
    private lazy var dateLabel = UILabel().then {
        $0.text = "당첨금:"
    }

    private lazy var stackView = UIStackView().then {
        $0.spacing = 10.0
        $0.axis = .vertical
        $0.distribution = .fill
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureLayout()
    }

    func configureUI() {
        view.backgroundColor = .systemBackground
    }

    func configureLayout() {
        [
            stackView, dateLabel
        ].forEach { view.addSubview($0) }

        [
            label1, label2, label3, label4, label5, label6,
            label7
        ].forEach { stackView.addArrangedSubview($0) }

        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(80)
            $0.horizontalEdges.equalToSuperview().inset(80)
        }
        dateLabel.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo (stackView.snp.bottom).offset(20)
            $0.horizontalEdges.equalTo(stackView)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(40)
        }

    }

}
