Class sehinde.Advent2021.Day3 Extends sehinde.Advent2021.Base
{

ClassMethod Import(dir As %String = "/usr/local/2021-3.txt") As %Status
{
#Include %occStatus

    // Open my text file and check it exists

    IF ##class(%File).Exists(dir) '=1 {
        //$$$ISERR
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


            set line = file.ReadLine()

            write *32

            write line,!

            // Uses $Piece to extract lines using the space as a delimiter and assign them to an array called directions

            set firstbit(count)=$EXTRACT(line)

            set secondbit(count)=$EXTRACT(line,2)

            set thirdbit(count)=$EXTRACT(line,3)

            set fourthbit(count)=$EXTRACT(line,4)

            set fifthbit(count)=$EXTRACT(line,5)

            set count = $INCREMENT(count)

            write "Counter: ",count ,!

        }

        

           
            //write !, "1st iteration of directions array ",$ZSTRIP(directions(1),"*P"),!
            //write !, "Last iteration of directions array ",$ZSTRIP(directions(1000),"*P"),!

            write !, "End of loop import process complete"

            write *32

            write "Done" ,!

        
            do ..PartOne(.firstbit,.secondbit,.thirdbit,.fourthbit,.fifthbit,.count)
}

/// Description
ClassMethod PartOne(ByRef firstbit As %ArrayOfDataTypes, ByRef secondbit As %ArrayOfDataTypes, ByRef thirdbit As %ArrayOfDataTypes, ByRef fourthbit As %ArrayOfDataTypes, ByRef fifthbit As %ArrayOfDataTypes, ByRef count As %Integer) As %Status
{

    set count=1
    set firstzero=0
    set firstone=0
    set secondzero=0
    set secondone=0
    set thirdzero=0
    set thirdone=0
    set fourthzero=0
    set fourthone=0
    set fifthzero=0
    set fifthone=0


    // Set up a while loop to go through the zero's and one's and set variables to count the numbers
    While count<13
       {
            
            write "Iteration: ",count ,!

            if firstbit(count)=0 {
                write "This is zero",!
                set firstzero=firstzero+1
            } else {
                write "This is one",!
                set firstone=firstone+1
            }


            set count = $INCREMENT(count)

       }

       // Output the numbers to the screen
       write "Most common zero: ", firstzero,!
       write "Most common one: ", firstone,!

       // Use the greater than to output the most common operation to the screen.
       if firstone>firstzero {
           write "First one most common !" ,!
       } else {
            write "First zero most common !",!
       }
}

}
