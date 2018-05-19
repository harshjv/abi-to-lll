(seq

  ;; Memory.
  (def 'scratch 0x0)

  ;; Storage
  (def 's_contractAddress 0x0)
  (def 's_randomTestData 0x1)
  

  ;; Jumping here causes an EVM error.
  (def 'invalid-location 0x02)

  ;; Function IDs
  (def 'halve 0x20fb79e7) ;; halve(uint256)
  (def 'initialize 0x8129fc1c) ;; initialize()
  (def 'replace 0xcabfb934) ;; replace(address)
  (def 'double 0xeee97206) ;; double(uint256)
  

)
