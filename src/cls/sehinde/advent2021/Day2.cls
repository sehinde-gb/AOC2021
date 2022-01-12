Class sehinde.Advent2021.Day2 Extends sehinde.Advent2021.Base
{

ClassMethod Import(dir As %String = "/usr/local/2021-2.txt") As %Status
{
#Include %occStatus

    // Open my text file and check it exists

    IF ##class(%File).Exists(dir) '=1 {
        $$$ISERR
        write !, "Unable to Open: "_dir

        QUIT

    } ELSE { 
        //$$$ISOK
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

            // Uses $Piece to extract lines using the space as a delimiter and assign them to an array called directions

            set directions(count)=$PIECE(line,delim,1,9)
            
            set count = $INCREMENT(count)

            write "Counter: ",count ,!

        }
            
            write !,*32

            write !, "Our array has been set up"

            write !,*32

    
            //write !, "1st iteration of directions array ",$ZSTRIP(directions(1),"*P"),!
            //write !, "Last iteration of directions array ",$ZSTRIP(directions(1000),"*P"),!

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
            } While (count<1001)

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

// Based on your calculations, the planned course doesn't seem to make any sense. 

// You find the submarine manual and discover that the process is actually slightly more complicated.

ClassMethod PartTwo(ByRef directions As %ArrayOfDataTypes, ByRef count As %Integer) As %Status
{

        set delim=" "
        set count=1
        set direction=0
        set amount=0
        set depth=0
        set hopos=0
        set aim=0
        set total=0
       

          
            Do {
                // Output the iterations number
                write "Iteration: ",count ,!

                // Extract the direction separately from the numerical value
                set direction(count) = $PIECE(directions(count),delim)
                set amount(count)= $PIECE(directions(count),delim,*)
                               
                // Determine the direction the sub is heading and work out if the depth has changed or not.
                // If it has been changed then output this and calculate the new depth.
                if direction(count)="forward" {
                    if aim=0 {
                        write "Depth does not change" ,!
                        write "Aim is: ", aim,!
                        write direction(count) ,!
                        write amount(count) ,!
                        set hopos=amount(count)+hopos
                        write "Horizontal position: ",hopos ,!

                    } else {
                        write "Depth does change" ,!
                        write "Aim was: ", aim,!
                        write direction(count) ,!
                        write amount(count) ,!
                        set hopos=amount(count)+hopos
                        write "Horizontal position: ",hopos ,! 
                        set depth=amount(count)*aim
                        write "Depth is: ", depth,!
                    }                   
                // If the direction is lower add the aim to the new depth    
                } elseif direction(count)="down" {
                        write direction(count) ,!
                        write amount(count) ,!
                        write "Aim was: ",aim,!
                        set aim=aim+amount(count)
                        write "Aim is: ",aim,!
                        write "Horizontal position: ",hopos ,! 
                        
                // If the direction is higher subtract the aim from the new depth    
                }elseif direction(count)="up" {
                        write direction(count) ,!
                        write amount(count) ,!
                        write "Aim was: ",aim,!
                        set aim=aim-amount(count)
                        write "Aim is: ",aim ,!
                        write "Horizontal position: ",hopos ,!                         
                } else {
                    write "Something went wrong" ,!
                }
                // Increment the counter until it reaches the limit of 1000
                set count = $INCREMENT(count)
            } While(count<1001)

            set total=hopos*depth
            write "Total: ",total,!
}

}
