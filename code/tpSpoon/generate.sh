#!/usr/bin/env bash

# Paths
path="$HOME/IdeaProjects/V-V-TP6/code/tpSpoon"
code="$path/src/main"
resources="$code/resources"

echo "...> Delete the instrumented code..."
rm -Rf $resources/example-instrumented/*

echo
echo "####################"
echo "Clean and install..."
echo "####################"
echo
echo "...> entering $path"
cd $path
mvn clean install
echo "...> entering $resources/example"
cd "$resources/example"
mvn clean install
echo
echo "#################################"
echo "Generate the instrumented code..."
echo "#################################"
echo
java -cp $path/target/tpSpoon-1.0-SNAPSHOT-jar-with-dependencies.jar vv.spoon.MainExample $resources/example $resources/example-instrumented

echo
echo "################################"
echo "Compile the instrumented code..."
echo "################################"
echo
java -cp $resource/example-instrumented/target/example-1.0-SNAPSHOT.jar example.A 2

