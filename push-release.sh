#!/bin/bash

git clone https://github.com/awsdevopsssp/nov-devops-1.git
cd nov-devops-1
git checkout master
git pull
git push origin -f master:uat
git push origin -f master:nav
git push origin -f master:dev







