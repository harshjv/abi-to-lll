(seq

  ;; Function IDs and locations
  (include "./lib/constants.lsp")

  ;; Utilities
  (include "./lib/utilities.lsp")

  ;; TODO
  ;; Provide template for constructor from ABI

  (returnlll
    (seq
      {% for key, val in fnMap %}
      ;; {{ val.sig }}
      (function {{key}}
        (seq{% if not val.payable %} not-payable{% endif %}
          ;; TODO
          ;; Provide template for parameters passed from ABI

          ;; body
          (stop)))
          {% endfor %}
      (panic))))
