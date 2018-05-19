(seq

  ;; Function IDs and locations
  (include "./lib/constants.lsp")

  ;; Utilities
  (include "./lib/utilities.lsp")

  ;; Constructor
  ;; TODO
  ;; constructor(address)

  ;; Events
  ;; TODO
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
