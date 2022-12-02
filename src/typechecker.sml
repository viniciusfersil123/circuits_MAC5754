structure TypeChecker =
struct

open Grammar

exception TypeMismatch
exception FunctionTwoNotImplemented
exception StatisticsNotImplemented
exception TypeError

fun extractBool (Primitivo(Boolean_ i)) = i
    | extractBool _ = raise TypeMismatch

fun extractInt (Primitivo(Int_ i)) = i
    | extractInt _ = raise TypeMismatch

fun extractFloat (Primitivo(Float_ i)) = i
    | extractFloat _ = raise TypeMismatch

fun extractResistance (Fisico(Resistencia_ i)) = i
    | extractResistance _ = raise TypeMismatch

fun typeof (Primitivo(Float_ _)) = "float"
    | typeof (Primitivo(Int_ _)) = "int"
    | typeof (Primitivo(Boolean_ _)) = "boolean"
    | typeof (Fisico(Resistencia_ _)) = "Resistencia"
    | typeof _ = "null"

fun oper("+", Primitivo(Int_ i),Primitivo(Int_ j)) = Primitivo (Int_ (i+j))
   | oper("+", Primitivo(Float_ i),Primitivo(Float_ j)) = Primitivo (Float_ (i+j))
   | oper("++",Resistencia(Float_ i),Resistencia(Float_ j)) = Resistencia(Float_ (i+j))
   | oper(_,_,_) = raise FunctionTwoNotImplemented

fun exprTypes e1 e2 = (typeof e1) = (typeof e2)
fun isType e1 t = (typeof e1) = t

fun intToFloat (Primitivo(Int_ i)) = Real.fromInt i
   | intToFloat (_) = raise TypeMismatch

fun printValuesFList(Primitivo (Int_ i)) = print("Valor: " ^ (Int.toString i) ^ "\n")

fun functionTwo("getFloat", Sample ls, Primitivo(Int_ i)) = List.nth(ls,i)
  | functionTwo("getInt", Sample ls, Primitivo(Int_ i)) = List.nth(ls,i)
  | functionTwo("getString", Sample ls, Primitivo(Int_ i)) = List.nth(ls,i)
  | functionTwo(_,_,_) = raise FunctionTwoNotImplemented

end
