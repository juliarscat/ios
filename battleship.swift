import UIKit

class ViewController: UIViewController {
  
  // Two dimensional array representing the game board
  var gameBoard = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
  
  // Place the ships on the game board
  func placeShips() {
    let ships = [2, 3, 3, 4, 5]
    for shipLength in ships {
      var shipPlaced = false
      while !shipPlaced {
        let x = Int.random(in: 0...9)
        let y = Int.random(in: 0...9)
        let isHorizontal = Bool.random()
        
        if isHorizontal {
          if x + shipLength < 10 {
            var clear = true
            for i in x..<x + shipLength {
              if gameBoard[i][y] == 1 {
                clear = false
                break
              }
            }
            if clear {
              for i in x..<x + shipLength {
                gameBoard[i][y] = 1
              }
              shipPlaced = true
            }
          }
        } else {
          if y + shipLength < 10 {
            var clear = true
            for i in y..<y + shipLength {
              if gameBoard[x][i] == 1 {
                clear = false
                break
              }
            }
            if clear {
              for i in y..<y + shipLength {
                gameBoard[x][i] = 1
              }
              shipPlaced = true
            }
          }
        }
      }
    }
  }
  
  // Attack a coordinate on the game board
  func attack(x: Int, y: Int) -> Bool {
    if gameBoard[x][y] == 1 {
      gameBoard[x][y] = 2
      return true
    } else {
      return false
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    placeShips()
  }
}
