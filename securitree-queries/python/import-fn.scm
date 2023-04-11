;; __import__ function
(call
	function: (identifier) @name (#eq? @name "__import__")
	(argument_list
		. (identifier) @result
	)
)
