{-# LANGUAGE TypeApplications #-}

module Main where

import Hello

main :: IO ()
main = getConfig >>= print
