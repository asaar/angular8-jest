export a=`cat num`
export a=`expr $a + 1`
echo $a > num

npm i slnodejs
export NODE_DEBUG=sl
./node_modules/.bin/slnodejs config --tokenfile sltoken.txt --appname Angular8-Jest_Repro --branch master --build `cat num`
npm run-script build
./node_modules/.bin/slnodejs build --tokenfile sltoken.txt --buildsessionidfile buildSessionId --workspacepath dist --scm git --projectroot `pwd`
npm test
./node_modules/.bin/slnodejs start --tokenfile sltoken.txt --buildsessionidfile buildSessionId --teststage "Jest Tests"
./node_modules/.bin/slnodejs nycReport --tokenfile sltoken.txt --buildsessionidfile buildSessionId 
./node_modules/.bin/slnodejs end --tokenfile sltoken.txt --buildsessionidfile buildSessionId
