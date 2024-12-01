package main

import "core:fmt"
import "core:os"
import "core:slice"
import "core:strconv"
import "core:strings"

main :: proc() {
	data, ok := os.read_entire_file("1.input")
	if !ok {
		return
	}
	defer delete(data)

	it := string(data)

	x := [dynamic]int{}
	y_count := make(map[int]int)
	defer delete(x)
	defer delete(y_count)

	for line in strings.split_lines_iterator(&it) {
		numbers := strings.fields(line)
		x_elem := strconv.atoi(numbers[0])
		y_elem := strconv.atoi(numbers[1])
		append(&x, x_elem)
		y_count[y_elem] = (y_count[y_elem] or_else 0) + 1
	}

	result := 0
	for x_elem in x {
	   result += x_elem * (y_count[x_elem] or_else 0)
	}
	fmt.println(result)
}
