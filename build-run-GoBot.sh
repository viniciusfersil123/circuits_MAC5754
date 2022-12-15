rm gobot-image*
ml-build sources.cm GoBot.main gobot-image > log.txt
sml @SMLload gobot-image* $1
