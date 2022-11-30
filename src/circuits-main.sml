(*(**) structure DarwinTest =*) 
structure CircuitsTest =
struct

    (*(**)fun darwin instrm =*)
	fun circuits instrm =
		let
			val _ = print "                                    \n"
			val _ = print "        Interpreting code...        \n"
			val _ = print "                                    \n"
		in
			1
		end

	fun main (prog_name) =
    	let
        (*(**)val _ = darwin (TextIO.openIn prog_name)*)
      		val _ = circuits (prog_name)
    	in
      		1
    	end

end