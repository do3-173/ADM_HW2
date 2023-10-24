#!/bin/bash
data=$(jq '{id: .id|tonumber, title: .title, total_books_count: [.works[].books_count|tonumber]|add}' "dataset/series.json")
echo "id,title,total_books_count"
echo "$data" | jq -s 'sort_by(.total_books_count)|reverse|.[:5] | .[] | "\(.id),\(.title),\(.total_books_count)"' -r