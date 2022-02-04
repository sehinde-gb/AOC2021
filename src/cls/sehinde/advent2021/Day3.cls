Class sehinde.Advent2021.Day3 Extends sehinde.Advent2021.Base
{

// You need to use the binary numbers in the diagnostic report to generate two new binary numbers (called the gamma rate and the epsilon rate)

ClassMethod PartOne(dir As %String = "/usr/local/2021-3.txt") As %Status
{

    // Open the text file and check it exists
    IF ##class(%File).Exists(dir) '=1 {
        //$$$ISERR
        write !, "Unable to Open: "_dir

        QUIT

    }ELSE { 
        //$$$ISOK
        write "File: "_dir_" is open"

    }

    // instantiate a new class called file
    set file = ##class(%Stream.FileCharacter).%New()

    // create a new variable called sc
    set sc = file.LinkToFile(dir)

    set count=1

    WHILE ('file.AtEnd)
    {
        
        set Record=file.ReadLine()
        write *32
        write Record,!
        // Find out the length (no of characters are within each record)
        set BitCount=$l(Record)
        // Loop extracts each record and adds 1 to the variables 
        for bitPos=1:1:BitCount {
        set bit=$extract(Record,bitPos)
        if $increment(bits(bitPos,bit))
        }
        zwrite bits
        //set the empty variables and then compare the bit position0 has to be greater than position 1
	    set Gamma="",Epsilon="",bit=""
        // If the no of 0 bits is greater than no of 1 bits then its assigned 0:1 or 1 to determine if its most common
        // or if its least common.
        // The bit is concatenated to a Gamma variable
        for bitPos=1:1:BitCount {
            set bit=$select($get(bits(bitPos,0))>$get(bits(bitPos,1)):0,1:1)
            set Gamma=Gamma_bit
        }

    // $translate searches the string for 10 and replaces it with 01 as a means of digit reversal
        set Epsilon=$translate(Gamma,10,"01")
        // Output the values and the convert to decimal
        write !,"Gamma=",Gamma,", Epsilon=",Epsilon,!
        set Result=..BinToDec(Epsilon)*..BinToDec(Gamma)
        write !,"Answer is: ",Result
	    write *32
        
        set count = $INCREMENT(count)

    }
}

// Method converts binary numbers in to decimal

ClassMethod BinToDec(Val = 0) As %Integer [ Private ]
{
	quit:'Val 0
	set ans=""
	//from 36bit to 40bit easier for translation to hex
	if $length(Val)#4 for i=1:1 set Val=0_Val quit:'($length(Val)#4)
	for i=0:1:$length(Val)/4-1 {
		set part=$extract(Val,i*4+1,i*4+4)
		set char=$case(part,"0000":0,"0001":1,"0010":2,"0011":3,"0100":4,"0101":5,"0110":6,"0111":7,1000:8,1001:9,1010:"A",1011:"B",1100:"C",1101:"D",1110:"E",1111:"F")
		set ans=ans_char
	}
	quit $zhex(""_ans)
}

/// Next, you should verify the life support rating, which can be determined by multiplying the oxygen generator rating by the CO2 scrubber rating.
ClassMethod PartTwo(dir As %String = "/usr/local/2021-3.txt", verbose = 0) As %Status
{
    // Open the text file and check it exists
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

    set line=0
    
    // Go through read each line and count each of them and assign the line to each record.
    WHILE ('file.AtEnd)
    {        
        set Record=file.ReadLine()
        set line=line+1
        //write counter,!
        write *32
        //write Record,!
        set recordsArr(line)=Record
        //write recordsArr(line),!
        //write "Line",line,!
    }

    // Initialise the answer variable and find out the length of a single record
    set Answer="",bitsCount=$length(recordsArr(1))
    //zwrite bitsCount
    // Merge the records array with newly created OxyArr and CO2Arr
    merge OxyArr=recordsArr,CO2Arr=recordsArr
    //zwrite CO2Arr

    // For each OxyArr record we will erase bits and set a new variable called Line
    // We will check the current and previous record and for each record we will
    // $order each line and set a new variable called Record and assign the OxyArr record to it
    // we will extract each record and then increment the bits and reset the bits and the Line.
    for bitPos=1:1:bitsCount {
        kill bits
        set Line=""
        if $order(OxyArr(""))'=$order(OxyArr(""),-1) {
            for  {
                set Line=$order(OxyArr(Line)) quit:Line=""
                set Record=OxyArr(Line)
                
                set bit=$extract(Record,bitPos)
                //write bit,! 
                if $increment(bits(bit)) set bits(bit,Line)=""
            }
            // BIT CRITERIA
            // We set the Maxbit to 1 and then see if the total 0 bits is greater than 1 bits (this is the bit criteria) and reset Maxbit and Line
            // then we order everything that is not related to Maxbit and then we erase the OxyArr record
            set MaxBit=1
            set:$get(bits(0))>$get(bits(1)) MaxBit=0
            set Line=""
            for  {
                set Line=$order(bits('MaxBit,Line)) quit:Line=""
                kill OxyArr(Line)
            }
        }

        kill bits
		set Line=""
        // For each CO2Arr record we will kill bits and create a new variable called Line
        // We will check the current and previous record and for each record we will
        // $order each line and set a new variable called Record and assign the CO2Arr record to it
        // we will extract each record and then increment the bits and reset the bits.
		if $order(CO2Arr(""))'=$order(CO2Arr(""),-1) {
			for  {
				set Line=$order(CO2Arr(Line)) quit:Line=""
				set Record=CO2Arr(Line)
                
				set bit=$extract(Record,bitPos)
                //write bit,! 
				if $increment(bits(bit)) set bits(bit,Line)=""
			}
            // BIT CRITERIA
            // We set the Minbit to 0 and then see if the total 1 bits is less than 0 bits (this is the bit criteria) and assign Minbit to 1 
            // set Line to null and then we order everything that is not related to Minbit and then we erase the OxyArr record
			set MinBit=0
			set:$get(bits(1))<$get(bits(0)) MinBit=1
			set Line=""
			for  {
				set Line=$order(bits('MinBit,Line)) quit:Line=""
				kill CO2Arr(Line)
			}
		}
	}
    // We see what lines we got up to by ordering the positions and assigning them to (line) variables
    set CO2Line=$order(CO2Arr("")),OxyLine=$order(OxyArr(""))
    //write CO2Line,!
    //write OxyLine,!
    // We create C02 and Oxy variables and assign the array and the position (line) variables
	set CO2=CO2Arr(CO2Line),Oxy=OxyArr(OxyLine)
	write !,"CO2=",CO2,", Oxy=",Oxy,!
	set Answer=..BinToDec(CO2)*..BinToDec(Oxy)
	write Answer,!
	quit Answer
}

}
