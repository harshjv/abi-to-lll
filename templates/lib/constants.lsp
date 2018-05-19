(seq

  ;; Memory.
  (def 'scratch 0x0)

  ;; Storage
  {% set storage = context.storage -%}
  {%- for name in storage %}(def '{{name}} {{loop.index0 | hex}})
  {% endfor %}

  ;; Jumping here causes an EVM error.
  (def 'invalid-location 0x02)

  ;; Function IDs
  {% set functions = context.functions -%}
  {%- for name, val in functions %}(def '{{name}} {{val.id}}) ;; {{val.sig}}
  {% endfor %}

)
