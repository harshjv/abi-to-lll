(seq

  ;; Function IDs and locations
  (include "./lib/constants.lsp")

  ;; Utilities
  (include "./lib/utilities.lsp")

  ;; TODO
  ;; Provide template for constructor from ABI

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
          
      ;; Initialized(bool)
      (function Initialized
        (seq not-payable
          ;; TODO
          ;; Provide template for parameters passed from ABI

          ;; body
          (stop)))
          
      ;; Replaced(address,address)
      (function Replaced
        (seq not-payable
          ;; TODO
          ;; Provide template for parameters passed from ABI

          ;; body
          (stop)))
          
      ;; Doubled(uint256)
      (function Doubled
        (seq not-payable
          ;; TODO
          ;; Provide template for parameters passed from ABI

          ;; body
          (stop)))
          
      ;; Halved(uint256)
      (function Halved
        (seq not-payable
          ;; TODO
          ;; Provide template for parameters passed from ABI

          ;; body
          (stop)))
          
      (panic))))
