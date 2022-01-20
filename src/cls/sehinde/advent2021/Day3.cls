Class sehinde.Advent2021.Day3 Extends sehinde.Advent2021.Base
{

ClassMethod Import(dir As %String = "/usr/local/2021-3.txt") As %Status
{
    set tSC=$$$OK
    set tFileOpen=0

    Try {
        // Open my text file and check it exists

        IF ##class(%File).Exists(dir) '=1 {
            $$$ThrowStatus($$$ERROR($$$GeneralError,"Couldn't open file "_dir))
            write !, "Unable to Open: "_dir

            QUIT

        } ELSE { 
            set tFileOpen=1

            write "File: "_dir_" is open"
        }
    } Catch e {
        Set tSC= e.AsStatus()
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

            set bits(count)=line

            set count = $INCREMENT(count)

            write "Counter: ",count ,!

        }

            write !, "End of loop import process complete"

            write *32

            write "Done" ,!
             

            do ..PartOne(.bits,.count)
}

/// Description
ClassMethod PartOne(ByRef bits As %ArrayOfDataTypes, ByRef count As %Integer) As %Status
{

    set count=1 
    set gamma=0
    set epsilon=0
    set zeros=0
    set ones=0
    set firstones=0
    set firstzeros=0
    set secondzeros=0
    set secondones=0
    set thirdzeros=0
    set thirdones=0
    set fourthzeros=0
    set fourthones=0
    set fifthzeros=0
    set fifthones=0
    set sixthzeros=0
    set sixthones=0
    set seventhzeros=0
    set seventhones=0
    set eighthzeros=0
    set eighthones=0
    set ninethzeros=0
    set ninethones=0
    set tenthzeros=0
    set tenthones=0
    set eleventhzeros=0
    set eleventhones=0
    set twelfthzeros=0
    set twelfthones=0


 
    While count<1001
       {
            
            write "Iteration: ",count ,!
            write bits(count) ,!
            
            write !,$LENGTH(bits(count))," characters in: ",bits(count)
            write !,*32

            set first(count)=$EXTRACT(bits(count))
            write "First: ",first(count),!
          
            if first(count)=0 {
               set firstzeros=firstzeros+1 
            } else {
               set firstones=firstones+1
            }
            
            set second(count)=$EXTRACT(bits(count),2)
            write "Second: ",second(count),!
          
            if second(count)=0 {
                set secondzeros=secondzeros+1      
            } else {
                set secondones=secondones+1       
            }


            set third(count)=$EXTRACT(bits(count),3)
            write "Third: ",third(count),!
          
            if third(count)=0 {
                set thirdzeros=thirdzeros+1 
            } else {
                set thirdones=thirdones+1        
            }

   
            set fourth(count)=$EXTRACT(bits(count),4)
            write "Fourth: ",fourth(count),!
        
            if fourth(count)=0 {
                set fourthzeros=fourthzeros+1 
            } else {
                set fourthones=fourthones+1   
            }

            set fifth(count)=$EXTRACT(bits(count),5)
            write "Fifth: ",fifth(count),!
          
            if fifth(count)=0 {
                set fifthzeros=fifthzeros+1 
            } else {
                set fifthones=fifthones+1   
            }

            set sixth(count)=$EXTRACT(bits(count),6)
            write "Sixth: ",sixth(count),!
          
            if sixth(count)=0 {
                set sixthzeros=sixthzeros+1 
            } else {
                set sixthones=sixthones+1   
            }

            set seventh(count)=$EXTRACT(bits(count),7)
            write "Seventh: ",seventh(count),!
          
            if seventh(count)=0 {
                set seventhzeros=seventhzeros+1 
            } else {
                set seventhones=seventhones+1   
            }

            set eighth(count)=$EXTRACT(bits(count),8)
            write "Eighth: ",eighth(count),!
          
            if eighth(count)=0 {
                set eighthzeros=eighthzeros+1 
            } else {
                set eighthones=eighthones+1   
            }

            set nineth(count)=$EXTRACT(bits(count),9)
            write "Nineth: ",nineth(count),!
          
            if nineth(count)=0 {
                set ninethzeros=ninethzeros+1 
            } else {
                set ninethones=ninethones+1   
            }


            set tenth(count)=$EXTRACT(bits(count),10)
            write "Tenth: ",tenth(count),!
          
            if tenth(count)=0 {
                set tenthzeros=tenthzeros+1 
            } else {
                set tenthones=tenthones+1   
            }

            set eleventh(count)=$EXTRACT(bits(count),11)
            write "Eleventh: ",eleventh(count),!
          
            if eleventh(count)=0 {
                set eleventhzeros=eleventhzeros+1 
            } else {
                set eleventhones=eleventhones+1   
            }


            set twelfth(count)=$EXTRACT(bits(count),12)
            write "Twelfth: ",twelfth(count),!
          
            if twelfth(count)=0 {
                set twelfthzeros=twelfthzeros+1 
            } else {
                set twelfthones=twelfthones+1   
            }

           

           set count = $INCREMENT(count)
            
         }

        write "Total First zeros: ",firstzeros,!
        write "Total First ones: ",firstones,!

         
        if firstzeros>firstones {
            set firstbit=0
            write "First bit: ",firstbit,!
            set epsfirstbit=1
            write "Eps First Bit: ",epsfirstbit,!
        } else {
            set firstbit=1
            write "First bit: ",firstbit,!
            set epsfirstbit=0
            write "Eps First Bit: ",epsfirstbit,!
        }      


        write "Total Second zeros: ",secondzeros,!
        write "Total Second ones: ",secondones,!

         
        if secondzeros>secondones {
            set secondbit=0
            write "Second bit: ",secondbit,!
            set epssecondbit=1
            write "Eps Second Bit: ",epssecondbit,!
        } else {
            set secondbit=1
            write "Second bit: ",secondbit,!
            set epssecondbit=0
            write "Eps Second Bit: ",epssecondbit,!
        }


        write "Total Third zeros: ",thirdzeros,!
        write "Total Third ones: ",thirdones,!

         
        if thirdzeros>thirdones {
            set thirdbit=0
            write "Third bit: ",thirdbit,!
            set epsthirdbit=1
            write "Eps Third Bit: ",epsthirdbit,!
        } else {
            set thirdbit=1
            write "Third bit: ",thirdbit,!
            set epsthirdbit=0
            write "Eps Third Bit: ",epsthirdbit,!
        }


        write "Total Fourth zeros: ",fourthzeros,!
        write "Total Fourth ones: ",fourthones,!

         
        if fourthzeros>fourthones {
            set fourthbit=0
            write "Fourth bit: ",fourthbit,!
            set epsfourthbit=1
            write "Eps Fourth Bit: ",epsfourthbit,!
        } else {
            set fourthbit=1
            write "Fourth bit: ",fourthbit,!
            set epsfourthbit=0
            write "Eps Fourth Bit: ",epsfourthbit,!
        }   


        write "Total Fifth zeros: ",fifthzeros,!
        write "Total Fifth ones: ",fifthones,!

         
        if fifthzeros>fifthones {
            set fifthbit=0
            write "Fifth bit: ",fifthbit,!
            set epsfifthbit=1
            write "Eps Fifth Bit: ",epsfifthbit,!
        } else {
            set fifthbit=1
            write "Fifth bit: ",fifthbit,!
            set epsfifthbit=0
            write "Eps Fifth Bit: ",epsfifthbit,!
        }


        write "Total Sixth zeros: ",sixthzeros,!
        write "Total Sixth ones: ",sixthones,!

         
        if sixthzeros>sixthones {
            set sixthbit=0
            write "Sixth bit: ",sixthbit,!
            set epssixthbit=1
            write "Eps Sixth Bit: ",epssixthbit,!
        } else {
            set sixthbit=1
            write "Sixth bit: ",sixthbit,!
            set epssixthbit=0
            write "Eps Sixth Bit: ",epssixthbit,!
        } 


        write "Total Seventh zeros: ",seventhzeros,!
        write "Total Seventh ones: ",seventhones,!

         
        if seventhzeros>seventhones {
            set seventhbit=0
            write "Seventh bit: ",seventhbit,!
            set epsseventhbit=1
            write "Eps Seventh Bit: ",epsseventhbit,!
        } else {
            set seventhbit=1
            write "Seventh bit: ",seventhbit,!
            set epsseventhbit=0
            write "Eps Seventh Bit: ",epsseventhbit,!
        }

         write "Total Seventh zeros: ",seventhzeros,!
        write "Total Seventh ones: ",seventhones,!

         
        if eighthzeros>eighthones {
            set eighthbit=0
            write "Eighth bit: ",eighthbit,!
            set epseighthbit=1
            write "Eps Eighth Bit: ",epseighthbit,!
        } else {
            set eighthbit=1
            write "Eighth bit: ",eighthbit,!
            set epseighthbit=0
            write "Eps Eighth Bit: ",epseighthbit,!
        } 


        if ninethzeros>ninethones {
            set ninethbit=0
            write "Nineth bit: ",ninethbit,!
            set epsninethbit=1
            write "Eps Nineth Bit: ",epsninethbit,!
        } else {
            set ninethbit=1
            write "Nineth bit: ",ninethbit,!
            set epsninethbit=0
            write "Eps Nineth Bit: ",epsninethbit,!
        }  


        if tenthzeros>tenthones {
            set tenthbit=0
            write "Tenth bit: ",tenthbit,!
            set epstenthbit=1
            write "Eps Tenth Bit: ",epstenthbit,!
        } else {
            set tenthbit=1
            write "Tenth bit: ",tenthbit,!
            set epstenthbit=0
            write "Eps Tenth Bit: ",epstenthbit,!
        }   



        if eleventhzeros>eleventhones {
            set eleventhbit=0
            write "Eleventh bit: ",eleventhbit,!
            set epseleventhbit=1
            write "Eps Eleventh Bit: ",epseleventhbit,!
        } else {
            set eleventhbit=1
            write "Eleventh bit: ",eleventhbit,!
            set epseleventhbit=0
            write "Eps Eleventh Bit: ",epseleventhbit,!
        }  


        if twelfthzeros>twelfthones {
            set twelfthbit=0
            write "Twelfth bit: ",twelfthbit,!
            set epstwelfthbit=1
            write "Eps Twelfth Bit: ",epstwelfthbit,!
        } else {
            set twelfthbit=1
            write "Twelfth bit: ",twelfthbit,!
            set epstwelfthbit=0
            write "Eps Twelfth Bit: ",epstwelfthbit,!
        }  






    write "Set First bits: ",firstbit,!
    write "Set Eps First bit: ", epsfirstbit,!
    write "Set Second bit: ",secondbit,!
    write "Set Eps Second bit: ", epssecondbit,!
    write "Set Third bit: ",thirdbit,!
    write "Set Eps Third bit: ", epsthirdbit,!
    write "Set Fourth bit: ",fourthbit,!
    write "Set Eps Fourth bit: ", epsfourthbit,!   
    write "Set Fifth bit: ",fifthbit,!
    write "Set Eps Fifth bit: ", epsfifthbit,!
    write "Set Sixth bit: ",sixthbit,!
    write "Set Eps Sixth bit: ", epssixthbit,!
    write "Set Seventh bit: ",seventhbit,!
    write "Set Eps Seventh bit: ", epsseventhbit,!
    write "Set Eighth bit: ",eighthbit,!
    write "Set Eps Eighth bit: ", epseighthbit,!
    write "Set Nineth bit: ",ninethbit,!
    write "Set Eps Nineth bit: ", epsninethbit,!
    write "Set Tenth bit: ",tenthbit,!
    write "Set Eps Tenth bit: ", epstenthbit,!
    write "Set Eleventh bit: ",eleventhbit,!
    write "Set Eps Eleventh bit: ", epseleventhbit,!
    write "Set Twelfth bit: ",twelfthbit,!
    write "Set Eps Twelfth bit: ", epstwelfthbit,!
    



    set gamma=firstbit_secondbit_thirdbit_fourthbit_fifthbit_sixthbit_seventhbit_eighthbit_ninethbit_tenthbit_eleventhbit_twelfthbit
    write "Gamma no is: ",gamma,!
    set epsilon=epsfirstbit_epssecondbit_epsthirdbit_epsfourthbit_epsfifthbit_epssixthbit_epsseventhbit_epseighthbit_epsninethbit_epstenthbit_epseleventhbit_epstwelfthbit
    write "Epsilon no is: ",epsilon,!
    

    set RowResult1=0,Power=1

    for i=$LENGTH(gamma):-1:1 {
    set RowResult1 = RowResult1 + ($EXTRACT(gamma,i)* Power)
    set Power = Power * 2

    }

    write RowResult1,!
    set RowResult2=0,Power=1

    for i=$LENGTH(epsilon):-1:1 {
        set RowResult2 = RowResult2 + ($EXTRACT(epsilon,i)* Power)
        set Power = Power * 2

    }

    write RowResult2,!

    set power=RowResult1*RowResult2
    write "Power is: ",power,!
}

}
