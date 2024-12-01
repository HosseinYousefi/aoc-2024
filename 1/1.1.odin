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
	y := [dynamic]int{}
	defer delete(x)
	defer delete(y)

	for line in strings.split_lines_iterator(&it) {
		numbers := strings.fields(line)
		x_elem := strconv.atoi(numbers[0])
		y_elem := strconv.atoi(numbers[1])
		append(&x, x_elem)
		append(&y, y_elem)
	}

	slice.sort(x[:])
	slice.sort(y[:])

	result := 0
	for i in 0..<len(x) {
		result += abs(x[i] - y[i])
	}
	fmt.println(result)
}
