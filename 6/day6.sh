#!/bin/sh

cat input|sed -r 's/^([a-z]).*/\1/g'|sort |uniq -c|sort|tail -n 1|awk '{print $2}'
cat input|sed -r 's/^[a-z]([a-z]).*/\1/g'|sort |uniq -c|sort|tail -n 1|awk '{print $2}'
cat input|sed -r 's/^[a-z][a-z]([a-z]).*/\1/g'|sort |uniq -c|sort|tail -n 1|awk '{print $2}'
cat input|sed -r 's/^[a-z][a-z][a-z]([a-z]).*/\1/g'|sort |uniq -c|sort|tail -n 1|awk '{print $2}'
cat input|sed -r 's/^[a-z][a-z][a-z][a-z]([a-z]).*/\1/g'|sort |uniq -c|sort|tail -n 1|awk '{print $2}'
cat input|sed -r 's/^[a-z][a-z][a-z][a-z][a-z]([a-z]).*/\1/g'|sort |uniq -c|sort|tail -n 1|awk '{print $2}'
cat input|sed -r 's/^[a-z][a-z][a-z][a-z][a-z][a-z]([a-z]).*/\1/g'|sort |uniq -c|sort|tail -n 1|awk '{print $2}'
cat input|sed -r 's/^[a-z][a-z][a-z][a-z][a-z][a-z][a-z]([a-z]).*/\1/g'|sort |uniq -c|sort|tail -n 1|awk '{print $2}'
