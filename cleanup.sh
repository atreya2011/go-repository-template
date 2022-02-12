#!/bin/bash
CURRENT_DIR=${PWD##*/}
sed -i "s/go-repository-template/${CURRENT_DIR}/g" .gitignore
sed -i "s/go-repository-template/${CURRENT_DIR}/g" go.mod
sed -i "s/go-repository-template/${CURRENT_DIR}/g" README.md
rm cleanup.sh
