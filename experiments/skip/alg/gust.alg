#!/bin/bash

PLANNER=(gust)
PLANNER_C=-1

DELTA=(0.15)
DELTA_C=0

BETA=(0.85)
BETA_C=0

USESPLIT=(1)
USESPLIT_C=0

#PRMSIZE=(100 1000 10000)
PRMSIZE=(1000)
PRMSIZE_C=0

ALPHA=(8)
ALPHA_C=0

B=(0.85)
B_C=0

#STATERADIUS=(2 4 6)
STATERADIUS=(6)
STATERADIUS_C=0

#NUMPRMEDGES=(5 10)
NUMPRMEDGES=(5)
NUMPRMEDGES_C=0

ALG_TOTAL=$((${#PLANNER[@]}  * ${#DELTA[@]} * ${#BETA[@]} * ${#USESPLIT[@]}* ${#PRMSIZE[@]} * ${#ALPHA[@]} * ${#B[@]} * ${#STATERADIUS[@]} * ${#NUMPRMEDGES[@]} ))
ALG_TOTAL_C=0

function morePlannerSettings() {
  local  __resultvar=$1
  local hasMore=true
  if [ "$ALG_TOTAL_C" -ge "$ALG_TOTAL" ];
  then
    hasMore=false
  fi
  ((ALG_TOTAL_C++))


  old=$PLANNER_C
  increment PLANNER[@] PLANNER_C
  if [ "$old" -gt "$PLANNER_C" ] || [ "$old" -eq "$PLANNER_C" ]
  then
    old=$DELTA_C
    increment DELTA[@] DELTA_C

  if [ "$old" -gt "$DELTA_C" ] || [ "$old" -eq "$DELTA_C" ]
  then
    old=$BETA_C
    increment BETA[@] BETA_C

  if [ "$old" -gt "$BETA_C" ] || [ "$old" -eq "$BETA_C" ]
  then
    old=$USESPLIT_C
    increment USESPLIT[@] USESPLIT_C

  if [ "$old" -gt "$USESPLIT_C" ] || [ "$old" -eq "$USESPLIT_C" ]
  then
    old=$PRMSIZE_C
    increment PRMSIZE[@] PRMSIZE_C
    if [ "$old" -gt "$PRMSIZE_C" ] || [ "$old" -eq "$PRMSIZE_C" ]
    then
      old=$ALPHA_C
      increment ALPHA[@] ALPHA_C
      if [ "$old" -gt "$ALPHA_C" ] || [ "$old" -eq "$ALPHA_C" ]
      then
	old=$B_C
	increment B[@] B_C
	if [ "$old" -gt "$ALPHA_C" ] || [ "$old" -eq "$ALPHA_C" ]
	then
	  old=$STATERADIUS_C
	  increment STATERADIUS[@] STATERADIUS_C
	  if [ "$old" -gt "$STATERADIUS_C" ] || [ "$old" -eq "$STATERADIUS_C" ]
	  then
	    increment NUMPRMEDGES[@] NUMPRMEDGES_C
	  fi
	fi
      fi
    fi
  fi
fi
fi
fi


  eval $__resultvar="'$hasMore'"
}

function getPlannerPathAttrs() {
  local  __resultvar=$1
  local path=""
  
  path="$path planner=${PLANNER[$PLANNER_C]}"
  path="$path prmsize=${PRMSIZE[$PRMSIZE_C]}"
  path="$path alpha=${ALPHA[$OMEGA_C]}"
  path="$path beta=${BETA[$BETA_C]}"
  path="$path delta=${DELTA[$DELTA_C]}"
  path="$path usesplit=${USESPLIT[$USESPLIT_C]}"
  path="$path b=${B[$B_C]}"
  path="$path stateradius=${STATERADIUS[$STATERADIUS_C]}"
  path="$path numprmedges=${NUMPRMEDGES[$NUMPRMEDGES_C]}"

  eval $__resultvar="'$path'" 
}

function getPlannerParamFile() {
  local  __resultvar=$1
  local param=""
  
  param="${param}Planner ? ${PLANNER[$PLANNER_C]}\n"
  param="${param}PRMSize ? ${PRMSIZE[$PRMSIZE_C]}\n"
  param="${param}Alpha ? ${ALPHA[$ALPHA_C]}\n"
  param="${param}Delta ? ${DELTA[$DELTA_C]}\n"
  param="${param}Beta ? ${BETA[$BETA_C]}\n"
  param="${param}UseSplit ? ${USESPLIT[$USESPLIT_C]}\n"
  param="${param}B ? ${B[$B_C]}\n"
  param="${param}StateRadius ? ${STATERADIUS[$STATERADIUS_C]}\n"
  param="${param}NumEdges ? ${NUMPRMEDGES[$NUMPRMEDGES_C]}\n"

  eval $__resultvar="'$param'" 
}
