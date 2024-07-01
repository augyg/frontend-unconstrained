{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ConstraintKinds #-}

module FrontendUnconstrained where

import Reflex.Dom.Core
import Control.Monad.IO.Class
import Control.Monad.Fix

type ObeliskWidget' t m =
  ( DomBuilder t m
  , MonadFix m
  , MonadHold t m
  , PostBuild t m
  , PerformEvent t m
  , TriggerEvent t m
  , Prerender t m
  , MonadIO (Performable m)
  )

data FrontendUnconstrained = FrontendUnconstrained
  { _frontendUnconstrained_head :: (forall t m. ObeliskWidget' t m => m ())
  , _frontendUnconstrained_body :: (forall t m. ObeliskWidget' t m => m ())
  }
