{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeOperators #-}

-- Example derived from:
--
-- https://hackage.haskell.org/package/optparse-generic-1.4.3/docs/Options-Generic.html

module Hello where

import Control.Monad.IO.Class (MonadIO)
import Options.Generic

data Config w = Config
  { bleeps :: w ::: Int <?> "Number of bleeps"
  , bloops :: w ::: Int <?> "Number of bloops"
  } deriving (Generic)

instance ParseRecord (Config Wrapped)
deriving instance Show (Config Unwrapped)

getConfig :: IO (Config Unwrapped)
getConfig = unwrapRecord "Hello"
