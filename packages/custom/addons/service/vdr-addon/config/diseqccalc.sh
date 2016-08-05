#!/bin/sh

[ -f /var/config/settings.conf ] && . /var/config/settings.conf

VDR_LNBS="$VDR_LNB1 $VDR_LNB2 $VDR_LNB3 $VDR_LNB4"
lbn_k=1
k=0

  for lnbs in $VDR_LNBS; do
      eval LNB_S=\$VDR_LNB$lbn_k  
      if [ $LNB_S = "true" ]; then
      
          eval POLAR_S=\$VDR_POLAR$lbn_k
          eval SAT_S=\$VDR_SAT$lbn_k
          
          if [ $POLAR_S = "Linear" ]; then
              echo "# LNB-$lbn_k SAT: $SAT_S"
              printf "%s 11700 V 9750 t v W15 [E0 10 38 F%X] [E1 10 38 F%X] W15 t\n" $SAT_S $(expr $k \* 4) $(expr $k \* 4)
              printf "%s 99999 V 10600 t v W15 [E0 10 38 F%X] [E1 10 38 F%X] W15 T\n" $SAT_S $(expr $k \* 4 + 1) $(expr $k \* 4 + 1) 
              printf "%s 11700 H 9750 t V W15 [E0 10 38 F%X] [E1 10 38 F%X] W15 t\n" $SAT_S $(expr $k \* 4 + 2) $(expr $k \* 4 + 2)
              printf "%s 99999 H 10600 t V W15 [E0 10 38 F%X] [E1 10 38 F%X] W15 T\n" $SAT_S $(expr $k \* 4 + 3) $(expr $k \* 4 + 3) 
          else
              echo "# LNB-$lbn_k SAT: $SAT_S"
              printf "%s 00000 R 10750 t v W15 [E0 10 38 F%X] [E1 10 38 F%X] W15 t\n" $SAT_S $(expr $k \* 4) $(expr $k \* 4)
              printf "%s 99999 R 10750 t v W15 [E0 10 38 F%X] [E1 10 38 F%X] W15 T\n" $SAT_S $(expr $k \* 4 + 1) $(expr $k \* 4 + 1) 
              printf "%s 00000 L 10750 t V W15 [E0 10 38 F%X] [E1 10 38 F%X] W15 t\n" $SAT_S $(expr $k \* 4 + 2) $(expr $k \* 4 + 2)
              printf "%s 99999 L 10750 t V W15 [E0 10 38 F%X] [E1 10 38 F%X] W15 T\n" $SAT_S $(expr $k \* 4 + 3) $(expr $k \* 4 + 3)
          fi
      fi
      k=$(expr $k + 1 )
      lbn_k=$(expr $lbn_k + 1 )
  done
