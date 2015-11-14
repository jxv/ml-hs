{-# LANGUAGE CPP #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module ML.Num 
    ( nearzerof
    , sqf
    , cubef
    , clampf
    , eqf
    , randf
    , biasgtf
    , recipinff
    ) where

#include <ml.h>

import Data.Word
import Foreign.C
import Foreign.Ptr
import ML.Common

foreign import ccall safe "nearzerof" c_nearzerof :: CFloat -> CUChar
foreign import ccall safe "sqf" c_sqf :: CFloat -> CFloat
foreign import ccall safe "cubef" c_cubef :: CFloat -> CFloat
foreign import ccall safe "clampf" c_clampf :: CFloat -> CFloat -> CFloat -> CFloat
foreign import ccall safe "eqf" c_eqf :: CFloat -> CFloat -> CUChar
foreign import ccall unsafe "randf" c_randf :: CFloat -> CFloat -> CFloat
foreign import ccall safe "biasgtf" c_biasgtf :: CFloat -> CFloat -> CUChar
foreign import ccall safe "recipinff" c_recipinff :: CFloat -> CFloat

nearzerof :: Float -> Bool
nearzerof = toBool. c_nearzerof . realToFrac

sqf :: Float -> Float
sqf x = realToFrac $ c_sqf (realToFrac x)

cubef :: Float -> Float
cubef x = realToFrac $ c_cubef (realToFrac x)

clampf :: Float -> Float -> Float -> Float
clampf l h x = realToFrac $ c_clampf (realToFrac l) (realToFrac h) (realToFrac x)

eqf :: Float -> Float -> Bool
eqf x y = toBool $ c_eqf (realToFrac x) (realToFrac y)

randf :: Float -> Float -> IO Float
randf l h = return . realToFrac $ c_randf (realToFrac l) (realToFrac h)

biasgtf :: Float -> Float -> Bool
biasgtf x y = toBool $ c_biasgtf (realToFrac x) (realToFrac y)

recipinff :: Float -> Float
recipinff x = realToFrac $ c_recipinff (realToFrac x)
