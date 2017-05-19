//
//  TicTacToeViewController.swift
//  Beats Music Player
//
//  Created by Qani Qaniu on 18/5/17.
//  Copyright © 2017 Qani Qaniu. All rights reserved.
//

import UIKit

var gameMode = 0

class TicTacToeViewController: UIViewController {
    
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    let playerOneMoves = Set<Int>()
    let playerTwoMoves = Set<Int>()
    var playerTurn = 1
    var scorePlayerOne = 0
    var scorePlayerTwo = 0
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    
    
    @IBAction func action(_ sender: AnyObject)
    {
        
        if gameMode == 2
        {
            
            if (gameState[sender.tag-1] == 0 && gameIsActive == true)
            {
                gameState[sender.tag-1] = activePlayer
                
                if (activePlayer == 1)
                {
                    
                    sender.setImage(UIImage(named: "coolguy"), for: UIControlState())
                    activePlayer = 2
                }
                else
                {
                    sender.setImage(UIImage(named: "nerd"), for: UIControlState())
                    activePlayer = 1
                }
            }
            
            gameIsActive = false
            
            for i in gameState
            {
                if i == 0
                {
                    gameIsActive = true
                    break
                }
            }
            
            if gameIsActive == false
            {
                // game has been drawn
                let alertController = UIAlertController(title: "Draw", message: "The game has been drawn", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                
            }
            
            for combination in winningCombinations
            {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
                {
                    gameIsActive = false
                    
                    if gameState[combination[0]] == 1
                    {
                        //player 1 has won
                        let alertController = UIAlertController(title: "Winner", message: "Player 1 has won", preferredStyle: UIAlertControllerStyle.alert)
                        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alertController, animated: true, completion: nil)
                        scorePlayerOne += 1
                        playerOneScore.text = "\(scorePlayerOne)"
                    }
                    else
                    {
                        //player 2 has won
                        let alertController = UIAlertController(title: "Winner", message: "Player 2 has won", preferredStyle: UIAlertControllerStyle.alert)
                        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alertController, animated: true, completion: nil)
                        scorePlayerTwo += 1
                        playerTwoScore.text = "\(scorePlayerTwo)"
                    }
                }
            }
        }
        else
        {
            
        }
    }
    
    
    @IBAction func playAgain(_ sender: AnyObject)
    {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    
    @IBOutlet weak var playerOneScore: UILabel!
    @IBOutlet weak var playerTwoScore: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
