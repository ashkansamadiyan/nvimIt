; Function definitions
(function_declaration) @function.outer
(function_declaration
  body: (statement_block) @function.inner)

; Arrow functions
(arrow_function) @function.outer
(arrow_function
  body: (statement_block) @function.inner)

; Parameters
(formal_parameters
  (identifier) @parameter.inner
  ","? @parameter.outer
  (required_parameter
    (identifier) @parameter.inner) @parameter.outer)

; JSX elements
(jsx_element
  (jsx_opening_element) @jsx_element.outer
  (jsx_closing_element) @jsx_element.outer
  (jsx_self_closing_element) @jsx_element.outer
  (jsx_element
    (jsx_opening_element) @jsx_element.inner
    (jsx_closing_element) @jsx_element.inner))
