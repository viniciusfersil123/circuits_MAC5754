signature GoBot =
 sig
	val parse : string -> unit                         
	val parseStr : string -> unit                         
 end;

type la = ((int * int) * int * int * int) list

fun readlist (infile : string) = let 
  val ins = TextIO.openIn infile 
  fun loop ins = 
   case TextIO.inputLine ins of 
      SOME line => line :: loop ins 
    | NONE      => [] 
in 
  loop ins before TextIO.closeIn ins 
end;

fun scanint(NONE) = 0
| scanint(SOME i) = i;

fun readfromlist ([], listamb) = listamb
    |  readfromlist(lin::col::wall::temp::luz::xs,listamb) = 
    let 
        val lin = scanint(Int.fromString(lin))
        val col = scanint(Int.fromString(col))
        val wall = scanint(Int.fromString(wall))
        val temp = scanint(Int.fromString(temp))
        val luz = scanint(Int.fromString(luz))        
    in 
        readfromlist(xs,listamb@[( (lin,col),wall,temp,luz) ] )
    end;

structure GoBotConfig : sig
	val energiaInicial: int
	val moveCost: int
(*	val readCost: int *)
    val listaMapa: string list
	(* listaAmbiente : (linha * Coluna) * temMuro * temperatura * luz) *)
	val listaAmbiente : la
	val largura : int
	val altura: int
	val posicaoInicial: int * int
	val MemoriaInicial: (string*int) list

	val printErro: string -> int
	val getLuzPos: (int * int) -> int
	val getTempPos: (int * int) -> int
	val getMuroPos: (int * int) -> int
	val getParamPosRec: (int*int*la* int ) -> int	
end=
struct
    val listaCon = readlist("config.txt")
	val energiaInicial = let 
	        val x::xs = listaCon in scanint(Int.fromString(x)) end;
	val moveCost = let 
	        val x::y::xs = listaCon in scanint(Int.fromString(y)) end; 
	(* val readCost = 1 *)
	val lii = let 
	        val x::y::z::xs = listaCon in scanint(Int.fromString(z)) end;
	val coli =let 
	        val x::y::z::w::xs = listaCon in scanint(Int.fromString(w)) end;
	val posicaoInicial : (int * int) = (lii,coli)

    val listaMapa = readlist("mapa.txt")

    	val altura = let val x::y::lm = listaMapa in scanint(Int.fromString(x)) end;    
	val largura = let val x::y::lm = listaMapa in scanint(Int.fromString(y)) end;
	val listaAmbiente = let val x::y::lm = listaMapa in readfromlist(lm,[]) end;
    
    val MemoriaInicial = [("GBlinha",#1 posicaoInicial),
                         ("GBcoluna",#2 posicaoInicial),
                         ("GBenergia",energiaInicial)
                         ];

	fun printErro (s:string) = let
		val x = print(s)
	in
		~998
	end

	(********************************)
	fun getParamPosRec (lin:int, col:int, l: la, i:int) =
		 (case l of nil => 0
		       | (x::xs) => (if( (#1 x) = (lin,col) ) then (case i of 2 => (#2 x)
		                                                    |       3 =>  (#3 x)
		                                                    |       _ => (#4 x))
		                                     else getParamPosRec(lin,col,xs,i)));  
	
	fun getMuroPos (lin,col) =  getParamPosRec(lin,col,listaAmbiente,2);	
	fun getTempPos (lin,col) =  getParamPosRec(lin,col,listaAmbiente,3);	
	fun getLuzPos (lin,col) =  getParamPosRec(lin,col,listaAmbiente,4);

     (***************************************************)


end
