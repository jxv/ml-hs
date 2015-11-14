module ML.Common where

import Foreign.C

toBool :: CUChar -> Bool
toBool = (/= 0)
