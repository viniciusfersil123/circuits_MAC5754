
structure Circuits : sig
	val parse : string -> unit                         
	val parseStr : string -> unit          
	val main : string * (string list) -> int               
     end
= struct


  structure CircuitsLrVals =
    CircuitsLrValsFun(structure Token = LrParser.Token)

  structure CircuitsLex =
    CircuitsLexFun(structure Tokens = CircuitsLrVals.Tokens)

  structure CircuitsParser =
    Join(structure LrParser = LrParser
	 structure ParserData = CircuitsLrVals.ParserData
	 structure Lex = CircuitsLex)


  fun invoke lexstream =
      let fun print_error (s,i:int,_) =
	      TextIO.output(TextIO.stdOut,
			    "Error, line " ^ (Int.toString i) ^ ", " ^ s ^ "\n")
       in CircuitsParser.parse(0,lexstream,print_error,())
      end

   fun parseStr (strin: string) = 
      let 
            val lista: string list ref = ref [strin]
      in
         let 
			val lexer = CircuitsParser.makeLexer (fn _ => let 
			                                        val x = if(!lista = nil)
			                                             then "" else hd(!lista)
                                                		val z = if(!lista = nil)
                                                		        then lista := nil
                                                		      else lista := tl(!lista) 
		                                            in 
			                                            x
                                                		end
                                                		)
	    val dummyEOF = CircuitsLrVals.Tokens.EOF(0,0)
    	    val dummySEMI = CircuitsLrVals.Tokens.SEMI(0,0)
	    fun loop lexer =
	        let val (result,lexer) = invoke lexer
		      val (nextToken,lexer) = CircuitsParser.Stream.get lexer
		      val _ = ()
	           in if CircuitsParser.sameToken(nextToken,dummyEOF) then ()
		      else loop lexer
	          end
           in loop lexer
          end
      end
	
  fun parse (arquivo: string) = 
		
      let val file = TextIO.openIn arquivo
			 val lexer = CircuitsParser.makeLexer (fn _ => (case TextIO.inputLine file
						                                       of SOME s => s
						                                        | _ => ""))														
	  val dummyEOF = CircuitsLrVals.Tokens.EOF(0,0)
	  val dummySEMI = CircuitsLrVals.Tokens.SEMI(0,0)
	  fun loop lexer =
	      let val (result,lexer) = invoke lexer
		  val (nextToken,lexer) = CircuitsParser.Stream.get lexer
		  val _ = ()
	       in if CircuitsParser.sameToken(nextToken,dummyEOF) then ()
		  else loop lexer
	      end
       in loop lexer
      end

		fun main (prog_name, args) =
			 let
				val srcFile = (hd(tl(args)))
				val _ = parse(srcFile); 
			 in
				1
		end

end (* structure Circuits *)


