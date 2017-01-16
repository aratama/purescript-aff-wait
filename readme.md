# purescript-aff-wait

An asyncronous effect which stop for the durations.

```haskell
main = void $ runAff errorShow pure do
    log "3..."
    wait (Seconds 1.0)
    log "2..."
    wait (Seconds 1.0)
    log "1..."
    wait (Seconds 1.0)
    log "Boom!"
```



# API Reference

## Module Control.Monad.Aff.Wait

#### `wait`

``` purescript
wait :: forall d m eff. (Duration d, MonadAff ("timer" :: TIMER | eff) m) => d -> m Unit
```

An asyncronous effect which stop for the durations.

#### `never`

``` purescript
never :: forall m eff. MonadAff ("timer" :: TIMER | eff) m => m Unit
```

An asyncronous effect which never finishes.


