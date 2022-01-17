Class sehinde.Advent2021.Day1 Extends sehinde.Advent2021.Base
{

ClassMethod Import(dir As %String = "/usr/local/2021-1.txt") As %Status
{
        // Open my text file and check it exists
        IF ##class(%File).Exists(dir) '=1 {
            
            write !, "Unable to Open: "_dir
            //return $$ERROR
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
                write !, "We are within the iterative loop"
                write *32
                write line,!
                
            
                // Uses $Piece to extract lines using the space as a delimiter and assign them to an array called measurements
                set measurements(count)=$PIECE(line, delim)
                
                set count = $INCREMENT(count)
                write "Counter: ",count ,!
                
            }
                write !,*32
                write !, "Double checking to see if the lines array is set"
                write !,*32
                
                
                write !, "1st iteration of measurements array ",$ZSTRIP(measurements(1),"*P"),!
                //write !, "Last iteration of measurements array ",$ZSTRIP(measurements(2000),"*P"),!
                
            
                write !, "End of loop import process complete"
                write *32

                write "Done" ,!

                
                
                do ..PartOne(.measurements,count)
}

ClassMethod PartOne(ByRef measurements As %ArrayOfDataTypes, count As %Integer) As %Status
{
    
                                
    // Initialise the variables that we will use.
                                                    
    set difference = 0
    
    set increase=0
    set decrease=0
    
    
    // Set up a loop that will loop subtract the difference between the measurements and it will then add up all of the 
    // differences that are less than 199 and it will set a positive variable that acts as a marker.
    // We will capture the very first difference and we will amend the count
    // And finally we will capture the negative counts and set a negative variable.
    

    
    #; write $ZSTRIP(measurements(20),"*P"),!
    set count=1 
    for i=1:1:1999 { 
        
        write "We have started processing !",!
         set difference(count) = measurements(count+1) - measurements(count)
         write difference(count) ,!
                    
        if (difference(count))>0 && (difference(count)<199){
            write "Difference increased : ",difference(count) ,!
            set increase = $INCREMENT(increase)
            set count = $INCREMENT(count)
            write count
        } elseif (difference(count)=199) {
            write "N/A - no previous measurement"
            set count = $INCREMENT(count) 
        } else {
            write "Difference decreased : ",difference(count) ,!
            set decrease = $INCREMENT(decrease)
            set count = $INCREMENT(count)
                        
        }
            write "Total Increased: ", increase,!
            write "Total Decreased: ", decrease,!
        }
        
            write "We have completed processing",!
}

ClassMethod PartTwo(ByRef measurements As %ArrayOfDataTypes, count As %Integer) As %Status
{
    
                                
    // Initialise the variables that we will use.
                                                    
    set secondsum=2
    set firstsum=1
     
    set count=1
    set increase=0
    set nochange=0
    set decrease=0

    WHILE (count<2000)
        {     
            write "We are iterating the loop  !",!
            //write "Count: ", count ,!

            // set up a loop and perform find the sum of each of 3 measurements where you have the first sum and the second sum
            
            
            set firstsum(count) = measurements(count) + measurements(count+1) + measurements(count+2)
            set secondsum(count) = measurements(count+1) + measurements(count+2) + measurements(count+3)

            write firstsum(count),!

            
            // conditional if the second is greater than first register an increase.
            // if they are the same then write no change to the screen
            // if anything else write there has been a decrease to the screen

            if secondsum(count) > firstsum(count)
            {
                // output these values to the screen
                write "The first sum is :",firstsum(count) ,!
                write "The second sum is :",secondsum(count) ,!
                
                set increase = increase+1
                write "Increase: ",increase ,!
              
            } elseif secondsum(count) = firstsum(count) {
                set nochange = nochange+1
                write "No Change: ",nochange ,!

                write "There has been no changes" ,!    
            } else {
                // output these values to the screen
                write "The first sum is :",firstsum(count) ,!
                write "The second sum is :",secondsum(count) ,!
                set decrease = decrease+1
                write "Decrease: ", decrease ,!
                
            }

            write "Count is : ",count ,!
                if count=1997 {
                    QUIT
                } else {
                    // on completion increment the counter
                    set count = $INCREMENT(count)
                }

}
}

ClassMethod Run(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)
    set sum=0
	while 'stream.AtEnd {
		set line=stream.ReadLine()
        set line=line\3-2
        set sum=sum+line
        if verbose w "line="_line," ","sum="_sum,!
    }
    return sum
}

ClassMethod Run2(verbose = 0) As %Integer
{
        
    set stream=..GetInput(..#InputFile)
    set sum=0
	while 'stream.AtEnd {
		set line=stream.ReadLine()
        set fuel=line
        set full=0
        for  {
            set fuel=fuel\3-2
            quit:fuel<0
            set full=full+fuel
            }  
        set sum=sum+full
        if verbose w "line="_line," ","sum="_sum,!
    }
    
    return sum
}

}
