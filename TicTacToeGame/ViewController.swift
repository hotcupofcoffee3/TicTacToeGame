//
//  ViewController.swift
//  TicTacToeGame
//
//  Created by Adam Moore on 4/6/18.
//  Copyright © 2018 Adam Moore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let x = "X"
    let o = "O"
    
    var xTurn = true
    var clickedButtonTags = [Int: String]()
    var gameOver = false
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBOutlet weak var diagonalWinnerLine: UIImageView!
    @IBOutlet weak var columnOneWinner: UIImageView!
    @IBOutlet weak var columnTwoWinner: UIImageView!
    @IBOutlet weak var columnThreeWinner: UIImageView!
    @IBOutlet weak var rowOneWinner: UIImageView!
    @IBOutlet weak var rowTwoWinner: UIImageView!
    @IBOutlet weak var rowThreeWinner: UIImageView!
    
    @IBOutlet weak var startOverButtonOutlet: UIButton!
    
    @IBAction func startOverButton (_ sender: UIButton) {
        
        for button in totalButtons {
            button.setImage(nil, for: .normal)
        }
        
        xTurn = true
        clickedButtonTags = [:]
        
        diagonalWinnerLine.image = nil
        columnOneWinner.image = nil
        columnTwoWinner.image = nil
        columnThreeWinner.image = nil
        rowOneWinner.image = nil
        rowTwoWinner.image = nil
        rowTwoWinner.image = nil
        
        gameOver = false
        
        winnerLabel.text = ""
        winnerLabel.isHidden = true
        startOverButtonOutlet.isHidden = true
        
        for button in totalButtons {
            button.isEnabled = true
        }
        
    }
    
    @IBOutlet var totalButtons: [UIButton]!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
       
        if gameOver == false {
            
            // Keeps from changing one already clicked
            for tag in clickedButtonTags.keys {
                if sender.tag == tag {
                    return
                }
            }
            
            // Changing turns and setting button images
            if xTurn {
                sender.setImage(UIImage(named: "cross.png"), for: .normal)
                clickedButtonTags[sender.tag] = x
            } else if !xTurn {
                sender.setImage(UIImage(named: "nought.png"), for: .normal)
                clickedButtonTags[sender.tag] = o
            }
            
            // First row
            
            if clickedButtonTags[1] == clickedButtonTags[2] && clickedButtonTags[1] == clickedButtonTags[3] {
                if let winner = clickedButtonTags[1] {
                    winnerLabel.text = "\(winner) is the winner!"
                    rowOneWinner.image = UIImage(named: "horizontalLine.png")
                    gameOver = true
                }
            }
            
            // Second row
            
            if clickedButtonTags[4] == clickedButtonTags[5] && clickedButtonTags[4] == clickedButtonTags[6] {
                if let winner = clickedButtonTags[4] {
                    winnerLabel.text = "\(winner) is the winner!"
                    rowTwoWinner.image = UIImage(named: "horizontalLine.png")
                    gameOver = true
                }
            }
            
            // Third row
            
            if clickedButtonTags[7] == clickedButtonTags[8] && clickedButtonTags[7] == clickedButtonTags[9] {
                if let winner = clickedButtonTags[7] {
                    winnerLabel.text = "\(winner) is the winner!"
                    rowThreeWinner.image = UIImage(named: "horizontalLine.png")
                    gameOver = true
                }
            }
            
            // First column
            
            if clickedButtonTags[1] == clickedButtonTags[4] && clickedButtonTags[1] == clickedButtonTags[7] {
                if let winner = clickedButtonTags[1] {
                    winnerLabel.text = "\(winner) is the winner!"
                    columnOneWinner.image = UIImage(named: "verticalLine.png")
                    gameOver = true
                }
            }
            
            // Second column
            
            if clickedButtonTags[2] == clickedButtonTags[5] && clickedButtonTags[2] == clickedButtonTags[8] {
                if let winner = clickedButtonTags[2] {
                    winnerLabel.text = "\(winner) is the winner!"
                    columnTwoWinner.image = UIImage(named: "verticalLine.png")
                    gameOver = true
                }
            }
            
            // Third column
            
            if clickedButtonTags[3] == clickedButtonTags[6] && clickedButtonTags[3] == clickedButtonTags[9] {
                if let winner = clickedButtonTags[3] {
                    winnerLabel.text = "\(winner) is the winner!"
                    columnThreeWinner.image = UIImage(named: "verticalLine.png")
                    gameOver = true
                }
            }
            
            // Left diagonal
            
            if clickedButtonTags[1] == clickedButtonTags[5] && clickedButtonTags[1] == clickedButtonTags[9] {
                if let winner = clickedButtonTags[1] {
                    winnerLabel.text = "\(winner) is the winner!"
                    diagonalWinnerLine.image = UIImage(named: "topLeftDiagonal.png")
                    gameOver = true
                }
            }
            
            // Right diagonal
            
            if clickedButtonTags[3] == clickedButtonTags[5] && clickedButtonTags[3] == clickedButtonTags[7] {
                if let winner = clickedButtonTags[3] {
                    winnerLabel.text = "\(winner) is the winner!"
                    diagonalWinnerLine.image = UIImage(named: "topRightDiagonal.png")
                    gameOver = true
                }
            }
            
            if clickedButtonTags.count >= 9 && gameOver == false {
                winnerLabel.text = "No one won!"
                gameOver = true
            }
            
            xTurn = !xTurn
            
        }
        
        if gameOver == true {
            
            for button in totalButtons {
                button.isEnabled = false
            }
            
            winnerLabel.isHidden = false
            startOverButtonOutlet.isHidden = false
            
            UIView.animate(withDuration: 1, animations: {
                self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                self.startOverButtonOutlet.center = CGPoint(x: self.startOverButtonOutlet.center.x + 500, y: self.startOverButtonOutlet.center.y)
            })
            
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        winnerLabel.isHidden = true
        startOverButtonOutlet.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        startOverButtonOutlet.center = CGPoint(x: startOverButtonOutlet.center.x - 500, y: startOverButtonOutlet.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

