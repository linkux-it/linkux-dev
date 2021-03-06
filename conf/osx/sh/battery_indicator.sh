#!/bin/bash
# modified from http://ficate.com/blog/2012/10/15/battery-life-in-the-land-of-tmux/

HEART='♥ '

battery_info=`ioreg -rc AppleSmartBattery`
current_charge=$(echo $battery_info | grep -o '"CurrentCapacity" = [0-9]\+' | awk '{print $3}')
total_charge=$(echo $battery_info | grep -o '"MaxCapacity" = [0-9]\+' | awk '{print $3}')

charged_slots=$(echo "(($current_charge/$total_charge)*5)+1" | bc -l | cut -d '.' -f 1)
if [[ $charged_slots -gt 5 ]]; then
  charged_slots=5
fi

echo -n '#[fg=colour196]'
for i in `seq 1 $charged_slots`; do echo -n "$HEART"; done

if [[ $charged_slots -lt 5 ]]; then
  echo -n '#[fg=colour254]'
  for i in `seq 1 $(echo "5-$charged_slots" | bc)`; do echo -n "$HEART"; done
fi

echo -n '#[fg=colour241]| '
echo $(ioreg -l | awk '$3~/Capacity/{c[$3]=$5}END{OFMT="%.2f%%";max=c["\"MaxCapacity\""];print(max>0?100*c["\"CurrentCapacity\""]/max:"?")}')
