PROPERTY='
gsm.sim.operator.numeric=,20801
gsm.sim.operator.iso-country=,fr
gsm.operator.numeric=,20801
gsm.operator.iso-country=,fr
'

for PROP in $PROPERTY; do
  NAME=${PROP%=*} VALUE=${PROP#*=}
  REPORT=$(getprop $NAME)
  TARGET=$(echo $REPORT | sed -r "s/[^,]{1,}/$VALUE/g") # dual-sim
  [ "$TARGET" = "$REPORT" ] || resetprop -n $NAME $TARGET
done
