#Begin C header
1 i\#include <stdio.h>\n#include <stdlib.h>\nvoid main() {

#Finish C header
$ a\}

#INPUT cmd
s/^([0-9]+)\s+INPUT\s+(\w+)/int \2;\nl\1: scanf("%i", \&\2);/

#PRINT cmd with string argument
s/PRINT\s+(".*")/printf(\1);/

#PRINT cmd with variable argument
s/PRINT\s+(\w+)/printf("%i", \1);/

#LET cmd
s/^([0-9]+)\s+LET\s+(\w+)=(.+)/int \2;\nl\1: \2=\3;/

#GOTO cmd
s/GOTO\s+([0-9]+)/goto l\1;/

#IF cmd other operators
#s/IF\s+(.+)\s+THEN/if (\1)\n{/
s/IF\s+(\w+)([^=].?)(\w+)\s+THEN/if (\1\2\3)\n{/

#IF cmd equal operator
s/IF\s+(\w+)=(\w+)\s+THEN/if (\1==\2)\n{/

#ENDIF cmd
s/^([0-9]+)\s+ENDIF/}/

#LINE NUMBER
s/^([0-9]+)/l\1:/


