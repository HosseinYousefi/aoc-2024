package main

import "core:fmt"
import "core:os"
import "core:slice"
import "core:strconv"
import "core:strings"

main :: proc() {
	data, ok := os.read_entire_file("2.input")
	if !ok {
		return
	}
	defer delete(data)

	it := string(data)

	safe_count := 0
	for line in strings.split_lines_iterator(&it) {
		numbers := strings.fields(line)
		last_num : int
		is_increasing : bool
		is_safe := true
		for number_elem, index in numbers {
		    number := strconv.atoi(number_elem)
			defer last_num = number
			if index == 0 {
				continue
			}
		    diff := abs(last_num - number)
			if diff < 1 || diff > 3 {
			    is_safe = false
				break
			}
			if index == 1 {
			    is_increasing = last_num < number
				continue
			}
			if is_increasing != (last_num < number) {
			    is_safe = false
				break
			}
		}
		if is_safe {
		    safe_count += 1
		}
	}
	fmt.println(safe_count)
}
