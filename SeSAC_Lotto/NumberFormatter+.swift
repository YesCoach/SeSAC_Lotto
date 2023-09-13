//
//  NumberFormatter+.swift
//  SeSAC_Lotto
//
//  Created by 박태현 on 2023/09/13.
//

import Foundation

extension NumberFormatter {

    static let format = {
        let format = NumberFormatter()
        format.numberStyle = .decimal
        return format
    }()

    static func convertData(number: Int) -> String? {
        return format.string(for: number)
    }

}
