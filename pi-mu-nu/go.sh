#! /bin/bash

if ! command -v form &> /dev/null
then
  echo "Install FORM"
  exit
fi

form nlo.frm
