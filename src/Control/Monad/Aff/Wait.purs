module Control.Monad.Aff.Wait (wait, never) where

import Control.Bind (void)
import Control.Monad.Aff (makeAff)
import Control.Monad.Aff.Class (class MonadAff, liftAff)
import Control.Monad.Eff.Timer (TIMER, setTimeout)
import Data.Int (floor)
import Data.Time.Duration (class Duration, Milliseconds(Milliseconds), fromDuration)
import Data.Unit (Unit, unit)
import Prelude (bind)

--| An asyncronous effect which stop for the durations.
wait :: forall d m eff. (Duration d, MonadAff (timer :: TIMER | eff) m) => d -> m Unit
wait duration = case fromDuration duration of
    Milliseconds ms -> waitForMilliseconds (floor ms)

waitForMilliseconds :: forall m eff. MonadAff (timer :: TIMER | eff) m => Int -> m Unit
waitForMilliseconds milliseconds = liftAff (makeAff \reject resolve -> void (setTimeout milliseconds (resolve unit)))

--| An asyncronous effect which never finishes.
never :: forall m eff. MonadAff (timer :: TIMER | eff) m => m Unit
never = do
    wait (Milliseconds 1000.0)
    never
