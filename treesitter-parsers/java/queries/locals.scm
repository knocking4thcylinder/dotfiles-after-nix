;; scopes
(method_declaration) @scope
(constructor_declaration) @scope
(block) @scope
(for_statement) @scope
(enhanced_for_statement) @scope
(catch_clause) @scope
(lambda_expression) @scope

;; local definitions
(variable_declarator
  name: (identifier) @definition.var)

(parameter
  name: (identifier) @definition.parameter)

(catch_formal_parameter
  name: (identifier) @definition.parameter)

;; references
(identifier) @reference

