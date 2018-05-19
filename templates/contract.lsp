(seq

  ;; Function IDs and locations
  (include "./lib/constants.lsp")

  ;; Utilities
  (include "./lib/utilities.lsp")

  {% if context._constructor %}
  {%- set _constructor = context._constructor -%}
  ;; Constructor
  ;; TODO
  ;; {{ _constructor.sig }}
  {%- endif %}

  ;; Events
  ;; TODO
  {% set events = context.events -%}
  {%- for name, val in events %};; event {{ val.sig }}
  {% endfor %}
  (returnlll
    (seq
      {% set functions = context.functions -%}
      {%- for name, val in functions %}
      ;; {{ val.sig }}
      (function {{name}}
        (seq{% if not val.payable %} not-payable{% endif %}
          ;; TODO
          ;; Provide template for parameters passed from ABI

          ;; body
          (stop)))
          {% endfor %}
      (panic))))
