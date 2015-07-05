#!/bin/bash
# modified from http://ficate.com/blog/2012/10/15/battery-life-in-the-land-of-tmux/

HEART='♥ '

current_charge=$(cat /proc/acpi/battery/BAT1/state | grep 'remaining capacity' | awk '{print $3}')
total_charge=$(cat /proc/acpi/battery/BAT1/info | grep 'last full capacity' | awk '{print $4}')

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
