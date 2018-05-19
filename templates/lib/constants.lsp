(seq

  ;; Memory.
  ;; TODO

  ;; Storage.
  ;; TODO

  ;; Jumping here causes an EVM error.
  (def 'invalid-location 0x02)

  ;; Function IDs
  {% set functions = context.functions -%}
  {%- for name, val in functions %}(def '{{name}} {{val.id}}) ;; {{val.sig}}
  {% endfor %}

)
