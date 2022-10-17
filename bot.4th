s" ./fetchPrice.sh" system 

s" prices.txt" included 

s" prices.txt" included

: trybThresholdPosetive 500 > if cr ." More than +5%" cr cr else cr ." Less than +5%" cr cr then ;

: sxpLeoThresholdPosetive 1000 > if cr ." More than +10%" cr cr else cr ." Less than +10%" cr cr then ;

: drgnThresholdPosetive 1500 > if cr ." More than +15%" cr cr else cr ." less than +15%" cr cr then ;

: trybThresholdNegative -500 < if cr ." More than -5%" cr cr else cr ." less than -5%" cr cr then ;

: sxpLeoThresholdNegative -1000 < if cr ." more than -10%" cr cr else cr ." less than -10%" cr cr then ;

: drgnThresholdNegative -1500 < if cr ." more than -15%" cr cr else cr ." less than -15%" cr cr then ;

trybThresholdPosetive

sxpLeoThresholdPosetive

sxpLeoThresholdPosetive

drgnThresholdPosetive

trybThresholdNegative

sxpLeoThresholdNegative

sxpLeoThresholdNegative

drgnThresholdNegative

bye