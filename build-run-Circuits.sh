rm circuits-image*
ml-build sources.cm Circuits.main circuits-image > log.txt
sml @SMLload circuits-image* $1
