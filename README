# kotlin-exercise
exercise with kotlin language - template

this project provides a default folder architecture for coding kotlin with maven.

by using the script from scripts/rename.sh, you can create you own folder architecture, namely

by redefine the package name, main class, also kotlin version which you have on local should

be provided so that the maven can run without problem.

# use default folder
the project already contain a default fold which you can use.

$mvn install

$java -jar target/kotlin-exercise-1.0-SNAPSHOT-jar-with-dependencies.jar

# use script to generate new folder architecture
## precondition to run script on MacOS
bash version should be >= 4.0.
usually you need add following line in ~/.bash_profile if you already installed the newest
bash and more than one bash version exist in your system.
export PATH=/usr/local/bin:$PATH

## run script
using script from project root folder you can define package name(-p), project name(-n), kotlin version(-v),
and the main class name (-m).

>chmod +x ./scripts/rename.sh

>kotlin-exercise$bash ./scripts/rename.sh -p "com.demo.dts" -n "kotlin-mvn-template" -k "1.4.0" -m "StartUp"

>$mvn install

>$java -jar target/kotlin-mvn-template-1.0-SNAPSHOT-jar-with-dependencies.jar

You can also run the StartUp.kt directly from IntelliJ IDEA by using menu entry "Run" from right mouse over StartUp.kt.

Note: if the project name (-n) is differnt as "kotlin-mvn-template", a new project folder will be created
in the same parent folder, please open the new project in IntelliJ IDEA.