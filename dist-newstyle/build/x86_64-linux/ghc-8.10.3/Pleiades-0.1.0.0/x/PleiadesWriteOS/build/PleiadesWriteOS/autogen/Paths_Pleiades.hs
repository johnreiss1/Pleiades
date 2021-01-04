{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_Pleiades (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/jenr/.cabal/bin"
libdir     = "/home/jenr/.cabal/lib/x86_64-linux-ghc-8.10.3/Pleiades-0.1.0.0-inplace-PleiadesWriteOS"
dynlibdir  = "/home/jenr/.cabal/lib/x86_64-linux-ghc-8.10.3"
datadir    = "/home/jenr/.cabal/share/x86_64-linux-ghc-8.10.3/Pleiades-0.1.0.0"
libexecdir = "/home/jenr/.cabal/libexec/x86_64-linux-ghc-8.10.3/Pleiades-0.1.0.0"
sysconfdir = "/home/jenr/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Pleiades_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Pleiades_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Pleiades_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Pleiades_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Pleiades_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Pleiades_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
