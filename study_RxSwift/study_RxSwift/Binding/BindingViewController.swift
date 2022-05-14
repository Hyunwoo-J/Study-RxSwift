//
//  BindingViewController.swift
//  study_RxSwift
//
//  Created by Hyunwoo Jang on 2022/05/15.
//

import NSObject_Rx
import RxCocoa
import RxSwift
import UIKit


/// 바인딩 관련 화면
class BindingViewController: UIViewController {
    
    /// 레이블
    @IBOutlet weak var lbl: UILabel!
    
    /// 텍스트 필드
    @IBOutlet weak var textField: UITextField!
    
    
    /// 초기화 작업을 실행합니다.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.becomeFirstResponder()
        
        textField.rx.text
            .bind(to: lbl.rx.text)
            .disposed(by: rx.disposeBag)
        
        /*:
            # Binder
            * 에러 이벤트를 전달받지 않는다.
            * 메인 쓰레드에서 실행됨을 보장한다. -> UI 관련 작업은 모두 메인 쓰레드에서 이뤄져야 하기 때문에 Binder를 사용하면 좋다.
         
         */
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        textField.resignFirstResponder() // 이전 화면으로 돌아갈 때 혹시나 키보드가 내려가지 않을 수 있어서 추가해주는 코드
    }
}
