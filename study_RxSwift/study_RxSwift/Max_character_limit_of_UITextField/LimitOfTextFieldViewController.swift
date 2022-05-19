//
//  LimitOfTextFieldViewController.swift
//  study_RxSwift
//
//  Created by Hyunwoo Jang on 2022/05/20.
//

import NSObject_Rx
import RxSwift
import UIKit


/// 텍스트 필드 글자 수 제한과 관련된 화면
class LimitOfTextFieldViewController: UIViewController {
    
    /// 아이디 필드
    @IBOutlet weak var idTextField: UITextField!
    
    /// 비밀번호 필드
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    /// 텍스트 필드의 글자 수를 제한합니다.
    /// - Parameters:
    ///   - text: 텍스트 필드에 입력되고 있는 텍스트
    ///   - number: 제한할 글자 수
    ///   - textField: 해당 텍스트 필드
    func limitString(_ text: String, number: Int, textField: UITextField) {
        if text.count > number {
            let index = text.index(text.startIndex, offsetBy: number)
            textField.text = String(text[..<index])
        }
    }
    
    
    /// 초기화 작업을 실행합니다.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 텍스트 필드에 값이 입력될 때마다 이벤트가 전달되므로 limitString 메소드를 통해 글자 수를 계속해서 확인한다.
        idTextField.rx.text.orEmpty
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onNext: {
                self.limitString($0, number: 20, textField: self.idTextField)
            })
            .disposed(by: rx.disposeBag)
        
        passwordTextField.rx.text.orEmpty
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onNext: {
                self.limitString($0, number: 15, textField: self.passwordTextField)
            })
            .disposed(by: rx.disposeBag)
    }
}

/*
 참고자료: https://rldd.tistory.com/207
 */
