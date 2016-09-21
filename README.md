# Calculator
Calculator Application for iOS devices. I made this app following the CS193p Spring 2016 lectures of Stanford University.
I am following Model-View-Controller design pattern in this app.



For information:

Note : Function is a special type of closure


func add(op1: Double, op2: Double) -> Double {
return op1 + op2
}

Point 0: Above function can be written as 
{(op1: Double, op2: Double) -> Double in return op1 + op2}

Point 1: This syntax is valid as Swift infers that this function accepts two arguments each
of type Double and that it returns the Double. So we can write as
{(op1, op2) in return op1 + op2}

Point 2: Also the closures in Swift have default argument names $0(first argument), $1(second argument), $2(third argument) and so on..
So we can write the above closure as
{($0, $1) in return $0 + $1}

Point 3: Since I am using defult argument names Swift says I dont need ($0, $1) so above closures can be written as
{return $0 + $1}

Point 4: Since $0 + $1 is a double and Swift infers that closure returns Double and it is the only statement so we can write it as
{$0 + $1}







