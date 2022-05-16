//
//  DriverViewController.swift
//  study_RxSwift
//
//  Created by Hyunwoo Jang on 2022/05/16.
//

import NSObject_Rx
import RxCocoa
import RxSwift
import UIKit


/// 드라이버 관련 화면
class DriverViewController: UIViewController {
    
    /// 레이블
    @IBOutlet weak var lbl: UILabel!
    
    /// 텍스트 필드
    @IBOutlet weak var txtField: UITextField!
    
    
    /// 초기화 작업을 실행합니다.
    override func viewDidLoad() {
        super.viewDidLoad()

        let output = txtField.rx.text.orEmpty
            .asDriver()
        
        output
            .drive(lbl.rx.text)
            .disposed(by: rx.disposeBag)
        
        output
            .map { _ in UIColor.systemBlue }
            .drive(lbl.rx.backgroundColor)
            .disposed(by: rx.disposeBag)
            
        /*:
            # Driver
            * 스케줄러를 따로 변경하지 않으면 메인 스케줄러에서 실행된다. -> UI 바인딩에 사용하면 좋다.
            * 시퀀스를 공유하기 때문에 share 연산자를 사용할 필요가 없다.
         */
    }
}
