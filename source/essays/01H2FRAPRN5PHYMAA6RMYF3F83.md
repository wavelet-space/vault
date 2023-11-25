# Disruptor

- Q: What s disruptor architecture?
- A: An alternative to limited queues for fast data exchange between concurrent threads.
     Read a technical papaer [here](https://lmax-exchange.github.io/disruptor/files/Disruptor-1.0.pdf).

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

## Terminoloy

```{glossary}

[end to end operation](https://www.investopedia.com/terms/e/end-to-end.asp)
  End-to-end describes a process that takes a system or service from beginning to end and delivers a complete functional solution, usually without needing to obtain anything from a third party.

```
