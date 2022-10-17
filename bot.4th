s" ./fetchPrice.sh" system 

s" prices.txt" included 

: trybThresholdPosetive 500 > if cr ." yes" cr cr else cr ." no" cr cr then ;

: sxpLeoThresholdPosetive 1000 > if cr ." yes" cr cr else cr ." no" cr cr then ;

: drgnThresholdPosetive 1500 > if cr ." yes" cr cr else cr ." no" cr cr then ;

: trybThresholdNegative -500 < if cr ." yes" cr cr else cr ." no" cr cr then ;

: sxpLeoThresholdNegative -1000 < if cr ." yes" cr cr else cr ." no" cr cr then ;

: drgnThresholdNegative -1500 < if cr ." yes" cr cr else cr ." no" cr cr then ;

trybThresholdPosetive

sxpLeoThresholdPosetive

sxpLeoThresholdPosetive

drgnThresholdPosetive

trybThresholdNegative

sxpLeoThresholdNegative

sxpLeoThresholdNegative

drgnThresholdNegative

bye