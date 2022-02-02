# nov-devops-1
this is for devops github training purpose



#### Testing push release to multiple branches
#!/bin/bash

git clone https://github.com
git checkout master
git pull
git push origin -f master:ci-cnc-demo
git push origin -f master:ci-cnc-ext-uat
git push origin -f master:ci-cnc-qa3



## Hi
### From Develop
