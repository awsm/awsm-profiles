#! /bin/bash 

: ${AWS_CONFIG=$HOME/.aws/config}
: ${AWSM_HOME=$HOME/.awsm}
: ${AWSM_PROFILE_FILE=$AWSM_HOME/.awsm-profile}

function list-profiles {
  local regex="^\[profile ([a-z]+)\]"
  cat "$AWS_CONFIG" | \
  while read LINE; do
    if [[ $LINE =~ $regex ]]
    then
      name="${BASH_REMATCH[1]}"
      local match=$(list-current-profile)
      if [[ $name == "$match" ]]
      then
        echo "$name *"
      else
        echo $name
      fi
    fi
  done
}

function list-current-profile {
  local regex="^export AWS_PROFILE=([a-z]+)"
  cat "$AWSM_PROFILE_FILE" | \
  while read LINE; do
    if [[ $LINE =~ $regex ]]; then
      name="${BASH_REMATCH[1]}"
      echo $name
    fi
  done
}

function select-profile {
  local profile=$(list-profiles | $FUZZY_FILTER)
  if [ -n "$profile" ]; then
    local regex="^([a-z]+)"
    if [[ $profile =~ $regex ]]; then
      name="${BASH_REMATCH[1]}"
      echo $name
    fi
  fi
}

function profile {
  local profile=$(select-profile)
  if [ -n "$profile" ]; then
    echo "export AWS_PROFILE=$profile" > $AWSM_PROFILE_FILE
  fi
}

function load_profile {
  if [ ! -n "$AWS_PROFILE" ]; then
    if [ -f "$AWS_PROFILE_FILE" ]; then
      source $AWSM_PROFILE_FILE
    fi
  fi
}

set +u
load_profile
set -u
