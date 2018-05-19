(seq

  ;; Memory.
  ;; TODO

  ;; Storage.
  ;; TODO

  ;; Jumping here causes an EVM error.
  (def 'invalid-location 0x02)

  ;; Function IDs
  {% for key, val in fnMap %}(def '{{key}} {{val.id}}) ;; {{val.sig}}
  {% endfor %}

)
