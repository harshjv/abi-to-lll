(seq

  ;; Function IDs and locations
  (include "./lib/constants.lsp")

  ;; Utilities
  (include "./lib/utilities.lsp")

  ;; constructor(address,bytes32)
  ;; only static types at the moment
  ;; TODO: add support for dynamic types
  (codecopy scratch (bytecodesize) 0x20)
  (sstore s_contractAddress @scratch)
  (codecopy scratch (+ bytecodesize 0x20) 0x20)
  (sstore s_randomTestData @scratch)

  ;; Events
  ;; TODO add helpers
  ;; event Initialized(bool)
  ;; event Replaced(address,address)
  ;; event Doubled(uint256)
  ;; event Halved(uint256)
  
  (returnlll
    (seq
      
      ;; halve(uint256)
      (function halve
        (seq not-payable
          ;; TODO
          ;; Provide template for parameters passed from ABI

          ;; body
          (stop)))
          
      ;; initialize()
      (function initialize
        (seq not-payable
          ;; TODO
          ;; Provide template for parameters passed from ABI

          ;; body
          (stop)))
          
      ;; replace(address)
      (function replace
        (seq not-payable
          ;; TODO
          ;; Provide template for parameters passed from ABI

          ;; body
          (stop)))
          
      ;; double(uint256)
      (function double
        (seq not-payable
          ;; TODO
          ;; Provide template for parameters passed from ABI

          ;; body
          (stop)))
          
      (panic))))
