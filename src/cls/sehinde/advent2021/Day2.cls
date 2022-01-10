Class sehinde.Advent2021.Day2 Extends sehinde.Advent2021.Base
{

ClassMethod Import(dir As %String = "/usr/local/2021-2.txt") As %Status
{

    // Open my text file and check it exists

    IF ##class(%File).Exists(dir) '=1 {

        write !, "Unable to Open: "_dir

        QUIT

    } ELSE { 

        write "File: "_dir_" is open"

    }

    // instantiate a new class called file

    set file = ##class(%Stream.FileCharacter).%New()

    // create a new variable called sc

    set sc = file.LinkToFile(dir)

    set count=1
    
    /// loop to go through the day8 txt file 

        WHILE ('file.AtEnd)

        {

            set delim=" "

            set line = file.ReadLine()

            write *32

            write line,!

            // Uses $Piece to extract lines using the space as a delimiter and assign them to an array called measurements

            set directions(count)=$PIECE(line,delim,1,9)
            
            set count = $INCREMENT(count)

            write "Counter: ",count ,!

        }
            
            write !,*32

            write !, "The array is now set"

            write !,*32

    
            //write !, "1st iteration of directions array ",$ZSTRIP(directions(1),"*P"),!
            //write !, "Last iteration of measurements array ",$ZSTRIP(directions(1000),"*P"),!

            write !, "End of loop import process complete"

            write *32

            write "Done" ,!

        
            do ..PartTwo(.directions,.count)
}

ClassMethod PartOne(ByRef directions As %ArrayOfDataTypes, ByRef count As %Integer) As %Status
{
        set count=1
        set delim=" "
        set counter=1
        set direction=0
        set amount=0
        set forwardsum=0
        set downsum=0
        set upsum=0
        set hpos=0
        set depth=0
        set total=0
    

        Do {
            
            write "Iteration: ",count ,!

            //write directions(count) ,!

            set direction(count) = $PIECE(directions(count),delim)
            set amount(count)= $PIECE(directions(count),delim,*)
            
            
            if direction(count)="forward"  {
                write direction(count) ,!
                write amount(count) ,!
                
                set forwardsum=amount(count)+forwardsum
                write "Forwards: ",forwardsum ,!
                

            } elseif direction(count)="down" {     
                write direction(count) ,!
                write amount(count) ,!

                set downsum=amount(count)+downsum
                write "Downs: ",downsum ,!


            } elseif direction(count)="up" {
               write direction(count) ,!
               write amount(count) ,!
            
               set upsum=amount(count)+upsum
               write "Ups: ",upsum ,!


            } else {
              write "Nothing is good this time"
            
            }

        
            // Increment the counter until it reaches the limit of 10
            set count = $INCREMENT(count)
            } While (count<11)

            write "Forward total is: ", forwardsum,!
            write "Down total is: ", downsum,!
            write "Up total is: ", upsum,!

            set hpos=forwardsum
            write "My horizontal position is: ",hpos,!

            set depth= downsum-upsum
            write "My depth is: ",depth,!

            set total=hpos*depth
            write "The total is: ",total,!
            
            //write $order(sum(""),-1)
            //set number=$order(sum(""),-1)
            //write number ,!
}

/// Description
ClassMethod PartTwo(ByRef directions As %ArrayOfDataTypes, ByRef count As %Integer) As %Status
{
    set count=1
        set delim=" "
        set counter=1
        set direction=0
        set amount=0
        set forwardsum=0
        set downsum=0
        set upsum=0
        set hpos=0
        set depth=0
        set total=0
        set aimforward=0
        set aim=0
    

        Do {
            
            write "Iteration: ",count ,!

            //write directions(count) ,!

            set direction(count) = $PIECE(directions(count),delim)
            set amount(count)= $PIECE(directions(count),delim,*)
            
            
            if direction(count)="forward"  {
                write direction(count) ,!
                write amount(count) ,!
                
                if aim=0 {
                    write "Our depth hasn't change",!
                } else {
                    write "Our depth has changed",!
                }
                
                //write "Forwardsum: ",forwardsum ,!
                //write "Amount: ",amount(count) ,!
                //set aim = amount(count) * forwardsum
                //write "Aim is: ",aim,!
                set hpos=amount(count)+amount(count)
                write "horizontal position: ", hpos,!
            } elseif direction(count)="down" {
                    write direction(count) ,!
                    write amount(count) ,!

                    set downsum=amount(count)+downsum
                    write "Downsum: ",downsum ,!
                    set aim=aim+downsum
                    
                    write "Aim (down): ",aim,!

            }elseif direction(count)="up" {
                            write direction(count) ,!
                            write amount(count) ,!
            
                            set upsum=amount(count)+upsum
                            write "Upsum: ",upsum ,!

                            set aim=aim-upsum
                            write "Aim up: ",aim,!
            } else {

            }
            
                
        
            // Increment the counter until it reaches the limit of 10
            set count = $INCREMENT(count)
        }
        While (count<11)
            write aimdown ,!
            write aimup,!
            set aim= aimdown-aimup
            write "aim ",aim,!

            // write "Forward total is: ", forwardsum,!
            // set aimforward = forwardsum
            // write "aimforward total is: ", aimforward,!
            
            // write "Down total is: ", downsum,!
            // set aimdown = downsum
            // write "aimdown total is:", aimdown,!

            // write "Up total is: ", upsum,!
            // set aimup = upsum
            // write "aimup total is:", aimup,!

            // set aimsub = aimdown - aimup
            // write "Aim subtracted: ", aimsub ,!

            // #;set hpos=forwardsum
            // #;write "My horizontal position is: ",hpos,!

            // #;set depth= downsum-upsum
            // #;write "My depth is: ",depth,!

            // #;set total=hpos*depth
            // #;write "The total is: ",total,!
            
            // //write $order(sum(""),-1)
            // //set number=$order(sum(""),-1)
            // //write number ,!
}

}
