;; Example: treat text blocks as embedded Java (or plain text)
(text_block) @injection.content

;; Example: Java annotations sometimes contain embedded expressions
(annotation
  (marker_annotation name: (identifier) @injection.language "java"))

;; Example: simple regex literal injection (if your grammar supports it)
(regex_literal) @injection.content @injection.language "regex"

