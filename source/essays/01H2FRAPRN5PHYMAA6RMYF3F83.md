# Disruptor pattern

- Q: What s disruptor pattern?
- A: An alternative to limited queues for fast data exchange between concurrent threads.
     Read a technical [paper](https://lmax-exchange.github.io/disruptor/files/Disruptor-1.0.pdf).
     Also read Martin Fowler's [article](https://martinfowler.com/articles/lmax.html) and LMAX's
     related [page](https://lmax-exchange.github.io/disruptor/).
  
## Implementation

- Entry
- EntryFactory
- Consumer
- ProducerBarrier
- ConsumerBarrier
- BatchHandler
- RingBuffer
- ClaimStrategy
  - SingleThreadClaimStrategy
  - MultiThreadClaimStrategy
- WaitStrategy
  - BusySpinWaitStrategy
  - YieldingWaitStrategy
  - BlockingWaitStrategy

## Terminology

```{glossary}
[end to end operation](https://www.investopedia.com/terms/e/end-to-end.asp)
  End-to-end describes a process that takes a system or service from beginning to end and delivers a complete functional solution, usually without needing to obtain anything from a third party.
```

## References

[[TODO move to bibtex]]

- https://trishagee.com/2011/07/16/dissecting_the_disruptor_why_its_so_fast_part_one__locks_are_bad/