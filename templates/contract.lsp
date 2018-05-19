(seq

  ;; Function IDs and locations
  (include "./lib/constants.lsp")

  ;; Utilities
  (include "./lib/utilities.lsp")

  {% if context._constructor %}
  {%- set _constructor = context._constructor -%}
  ;; {{ _constructor.sig }}
  ;; only static types at the moment
  ;; TODO: add support for dynamic types
  {%- for input in _constructor.inputs -%}
  {%- if not input.isDynamic -%}
  {%- if loop.first %}
  (codecopy scratch (bytecodesize) 0x20)
  {% else %}
  (codecopy scratch (+ bytecodesize {{(loop.index0 * 32) | hex}}) 0x20)
  {% endif -%}
  (sstore s_{{input.name}} @scratch)
  {%- endif -%}
  {% endfor %}
  {%- endif %}

  ;; Events
  ;; TODO add helpers
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
