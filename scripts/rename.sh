#!/bin/bash

if [ "$#" -ne 8 ]; then
    echo "You must enter exactly 4 command line arguments"
    echo "$#"
    exit 1
fi

src="src"
test="test"
pom="pom.xml"
kotlinSuffix="Kt"
currentFolder="${PWD##*/}"

while getopts p:n:k:m: flag
do
    case "${flag}" in
        p) package=${OPTARG};;
        n) projectName=${OPTARG};;
        k) kotlinVersion=${OPTARG};;
        m) mainClassName=${OPTARG};;
    esac
done

srcPackagePath="$src/main/kotlin/$package/"
testPackagePath="$src/${test}/kotlin/${package}.tests"
modifiedMainClassName=${mainClassName^}

if [ -d $src ]; then rm -Rf $src; fi
if [ -d $test ]; then rm -Rf $test; fi

echo "remove backup file if exist"
rm -rf $pom || true
rm -rf scripts/Main_bak.kt || true
rm -rf scripts/MainTest_bak.kt || true
rm -rf scripts/pom_bak.kt || true

echo "create backup file"
cp -f scripts/Main scripts/Main_bak.kt
cp -f scripts/MainTest scripts/MainTest_bak.kt
cp -f scripts/pom_.xml scripts/pom_bak.xml

echo "rename package"
sed -i -s "s/com.demo.kotlin/$package/" scripts/Main_bak.kt
sed -i -s "s/com.demo.kotlin.tests/$package.tests/" scripts/MainTest_bak.kt
sed -i -s "s/com.demo.kotlin.sayHi/$package.sayHi/" scripts/MainTest_bak.kt

echo "redefine kotlin version"
sed -i -s "s/1.4.0/$kotlinVersion/" scripts/pom_bak.xml

echo "rename main class name in pom.xml"
sed -i -s "s/com.demo.kotlin.StartUpKt/$package.$modifiedMainClassName$kotlinSuffix/" scripts/pom_bak.xml

echo "rename project name"
sed -i -g "s/kotlin-exercise/$projectName/" scripts/pom_bak.xml

echo "create iml file"
cp -f ./scripts/kotlin-exercise.iml.txt "./${projectName}.iml"

for i in $(find . -name \*.iml); do
    if [ $i != "./${projectName}.iml" ]; then
      rm -f $i
    fi
done

mkdir -p $srcPackagePath
mkdir -p $testPackagePath

echo "create main class"
mv -f scripts/Main_bak.kt "$srcPackagePath/${mainClassName}.kt"
testSuffix="Test"

echo "create test class"
mv -f scripts/MainTest_bak.kt "$testPackagePath/$mainClassName${testSuffix}.kt"
mv -f scripts/pom_bak.xml $pom

echo "remove cache"
rm -rf scripts/Main_bak.kt-s || true
rm -rf scripts/MainTest_bak.kt-s || true
rm -rf scripts/pom_bak.xml-g || true

if [ $currentFolder != $projectName ]; then
  echo "please open the project under: "
  echo $(dirname "$PWD")"/"$projectName
  mv ../{$currentFolder,$projectName}
fi
