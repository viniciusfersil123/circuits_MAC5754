
structure GoBot : sig
	val parse : string -> unit                         
	val parseStr : string -> unit          
	val main : string * (string list) -> int               
     end
= struct


  structure GoBotLrVals =
    GoBotLrValsFun(structure Token = LrParser.Token)

  structure GoBotLex =
    GoBotLexFun(structure Tokens = GoBotLrVals.Tokens)

  structure GoBotParser =
    Join(structure LrParser = LrParser
	 structure ParserData = GoBotLrVals.ParserData
	 structure Lex = GoBotLex)


  fun invoke lexstream =
      let fun print_error (s,i:int,_) =
	      TextIO.output(TextIO.stdOut,
			    "Error, line " ^ (Int.toString i) ^ ", " ^ s ^ "\n")
       in GoBotParser.parse(0,lexstream,print_error,())
      end

   fun parseStr (strin: string) = 
      let 
            val lista: string list ref = ref [strin]
      in
         let 
			val lexer = GoBotParser.makeLexer (fn _ => let 
			                                        val x = if(!lista = nil)
			                                             then "" else hd(!lista)
                                                		val z = if(!lista = nil)
                                                		        then lista := nil
                                                		      else lista := tl(!lista) 
		                                            in 
			                                            x
                                                		end
                                                		)
	    val dummyEOF = GoBotLrVals.Tokens.EOF(0,0)
    	    val dummySEMI = GoBotLrVals.Tokens.SEMI(0,0)
	    fun loop lexer =
	        let val (result,lexer) = invoke lexer
		      val (nextToken,lexer) = GoBotParser.Stream.get lexer
		      val _ = ()
	           in if GoBotParser.sameToken(nextToken,dummyEOF) then ()
		      else loop lexer
	          end
           in loop lexer
          end
      end
	
  fun parse (arquivo: string) = 
		
      let val file = TextIO.openIn arquivo
			 val lexer = GoBotParser.makeLexer (fn _ => (case TextIO.inputLine file
						                                       of SOME s => s
						                                        | _ => ""))														
	  val dummyEOF = GoBotLrVals.Tokens.EOF(0,0)
	  val dummySEMI = GoBotLrVals.Tokens.SEMI(0,0)
	  fun loop lexer =
	      let val (result,lexer) = invoke lexer
		  val (nextToken,lexer) = GoBotParser.Stream.get lexer
		  val _ = ()
	       in if GoBotParser.sameToken(nextToken,dummyEOF) then ()
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

end (* structure GoBot *)


