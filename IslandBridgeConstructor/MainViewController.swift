//
//  MainViewController.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/20/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var inputTextView: UITextView?
    @IBOutlet weak var outputTextView: UITextView?
    
    var presenter: MainPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.viewDidLoad()
    }
    
    private func setupView() {
        self.navigationItem.title = "Bridge Construction"
        
        inputTextView?.layer.borderColor = UIColor.lightGray.cgColor
        inputTextView?.layer.borderWidth = 1
        inputTextView?.textContainerInset = UIEdgeInsetsMake(20, 10, 20, 10)
        inputTextView?.delegate = self
        
        outputTextView?.layer.borderColor = UIColor.lightGray.cgColor
        outputTextView?.layer.borderWidth = 1
        outputTextView?.textContainerInset = UIEdgeInsetsMake(20, 10, 20, 10)
    }
    
    @IBAction func didTapClear() {
        presenter.didTapClear()
    }
    
    @IBAction func didTapExecute() {
        presenter.didTapExecute(input: inputTextView?.text ?? "")
    }
    
}

extension MainViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        outputTextView?.text = ""
    }
}

extension MainViewController: MainView {
    
    func hideKeyboard() {
        inputTextView?.resignFirstResponder()
    }
    
    func clearInput() {
        inputTextView?.text = ""
        outputTextView?.text = ""
    }
    
    func showInvalidInputError(message: String) {
        showErrorMessage(message)
    }
    
    func showInvalidInputError() {
        showErrorMessage("Invalid input format")
    }
    
    func showOutput(_ output: String) {
        outputTextView?.text = output
    }
    
}
