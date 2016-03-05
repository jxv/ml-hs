{-# LANGUAGE CPP #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module ML.V2 where

#include <ml.h>

import Data.Word
import Foreign.C
import Foreign.Ptr
import ML.Common
import qualified Data.Vector.Storable as SV

newtype V2f = V2f { unV2f :: SV.Vector Float }
    deriving (Eq, Ord, Read, Show, Monoid)
--    deriving (SV.Storable)

v2f :: Float -> Float -> V2f
v2f x y = V2f $ SV.fromListN 2 [x,y]
