#!/bin/bash
jq '{id: .id|tonumber, title: .title, total_books_count: [.works[].books_count|tonumber]|add}' "dataset/series.json" >> books_count.json
jq -s 'sort_by(.total_books_count)|reverse' books_count.json >> sorted.json 
echo "id,title,total_books_count"
jq -r '.[:5] | .[] | "\(.id),\(.title),\(.total_books_count)"' sorted.json
rm sorted.json books_count.json