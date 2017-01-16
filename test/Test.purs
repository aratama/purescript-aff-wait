module Test (main) where

import Control.Bind (void)
import Control.Monad.Aff (runAff)
import Control.Monad.Aff.Console (log)
import Control.Monad.Aff.Wait (wait, never)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, errorShow)
import Control.Monad.Eff.Timer (TIMER)
import Data.Time.Duration (Seconds(..))
import Data.Unit (Unit)
import Prelude (pure, bind, ($))

main :: forall eff. Eff (console :: CONSOLE, timer :: TIMER | eff) Unit
main = void $ runAff errorShow pure do
    log "3..."
    wait (Seconds 1.0)
    log "2..."
    wait (Seconds 1.0)
    log "1..."
    wait (Seconds 1.0)
    log "Boom!"
    never
