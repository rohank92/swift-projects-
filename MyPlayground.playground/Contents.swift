//is it prime

func testForPrime(userInput:Int) {
    switch userInput {
    case 0: print("0 is not a prime number")
    case 1: print("1 is not a prime number")
    case 2: print("2 is a prime number")
    default:
        for i in 2..<userInput {
            if userInput % i == 0 {
                print("\(userInput) is not a prime number")
                return
            }
        }
        print("\(userInput) is a prime number")
    }
}

 testForPrime(31)