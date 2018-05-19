(seq

  (def 'bytes4 (input)
    (div input (exp 0x02 0xe0)))

  (def 'function (function-hash body)
    (when (= (bytes4 (calldataload 0x0)) function-hash)
      body))

  (def 'only-recipient
    (when (!= (caller) @@s_recipient)
      (panic)))

  (def 'not-payable
    (when (> (callvalue) 0x0)
      (panic)))

)
