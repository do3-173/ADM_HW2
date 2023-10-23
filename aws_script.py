import json
from collections import Counter
import time

filepath = "dataset/list.json"
n = 5

start_time = time.time()

tags_array = []

with open(filepath, "r") as f:
    for line in f:
        tags = json.loads(line).get("tags", [])
        for tag in tags:
            tags_array.append(tag)

counter = Counter(tags_array)
top_tags = counter.most_common(n)

end_time = time.time()

print("tag: #usage")
print("-----------")
for tag, number_of_times in top_tags:
    print(f"{tag}: {number_of_times}")

print(f"\nExecution time: {end_time - start_time:.2f} seconds")