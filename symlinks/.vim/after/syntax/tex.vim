syn match texInputFile "\\path\s*\(\[.*\]\)\={.\{-}}"
     \ contains=texStatement,texInputCurlies,texInputFileOpt
syn match texInputFile "\\getenv\s*\(\[.*\]\)\={.\{-}}"
     \ contains=texStatement,texInputCurlies,texInputFileOpt
syn match texInputFile "\\IfFileExists\s*\(\[.*\]\)\={.\{-}}"
     \ contains=texStatement,texInputCurlies,texInputFileOpt
syn match texInputFile "\\bibliographystyle\s*\(\[.*\]\)\={.\{-}}"
     \ contains=texStatement,texInputCurlies,texInputFileOpt
