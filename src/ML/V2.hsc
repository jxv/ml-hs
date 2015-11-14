{-# LANGUAGE CPP #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module ML.V2 where

#include <ml.h>

import Data.Word
import Foreign.C
import Foreign.Ptr
import ML.Common

