structure Grammar =
struct

(* open Math;
exception VariableNotDeclared
exception SizeNotAllowed *)


datatype tipo_primitivo = Int_ of int
                        | Float_ of real
                        | Boolean_ of bool

(* datatype unidade = ohms | ampere | volts *)

datatype tipo_fisico = Resistencia_ of real
                        | Tensao_ of real
                        | Corrente_ of real

(* datatype tipo_fisico = Grandeza_ of real * unidade *)

datatype tipo = Fisico of tipo_fisico
              | Primitivo of tipo_primitivo
              | Void

(* datatype tipo = Primitivo of tipo_primitivo
              | Void *)

(* fun tokenize s = String.tokens (fn(c) => c = #",") (String.substring(s,1,(String.size s)-2))

fun toIntList nil = nil
   | toIntList is = List.map (fn(x) => Option.valOf (Int.fromString x)) is

fun toFloatList nil = nil
   | toFloatList is = List.map (fn(x) => Option.valOf (Real.fromString x)) is

fun toBoolList nil = nil
   | toBoolList is = List.map (fn(x) => Option.valOf (Bool.fromString x)) is *)


(* fun updateHt(ht: 'a AtomRedBlackMap.map,b,a: 'a): 'a AtomRedBlackMap.map =
    let
        val achou = AtomMap.find(ht,b)
    in
        case achou of
            NONE => raise VariableNotDeclared
            | SOME _ =>
                let
                    val (ht1,_) = AtomRedBlackMap.remove(ht, b)
                    val ht2 = AtomRedBlackMap.insert(ht1,b,a)
                in
                    ht2
                end
    end *)

fun show (Primitivo(Int_ i)) = Int.toString i
    | show (Primitivo(Boolean_ b)) = Bool.toString b
    | show (Primitivo(Float_ b)) = Real.toString b
    (* | show (Fisico(Grandeza_(v,u))) = show v ^ (case u of ohms => "Ohms" | ampere => "Ampere" | volts => "Volts") *)
    | show (Fisico(Resistencia r)) = Real.toString r ^ "Ohms"
    | show (Fisico(Tensao_ v)) = Real.toString v ^ "Volts"
    | show (Fisico(Corrente i)) = Real.toString i ^ "Ampere"
    | show _ = "null"

end
