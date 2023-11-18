---
bibliography:
  - references.bib
---

# Disruptor Architecture

## Poznámky

- Co a k čemu je disruptor?
  - Alternativa k omezeným frontám pro rychlou výměnu dat mezi souběžnými vlákny.

- [technický dokument](https://lmax-exchange.github.io/disruptor/files/Disruptor-1.0.pdf)

<!-- See {cite:t}`1987:nelson` for an introduction to non-standard analysis. -->

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

## Terminologie

```{glossary}

[end to end operation](https://www.investopedia.com/terms/e/end-to-end.asp)
  End-to-end describes a process that takes a system or service from beginning to end and delivers a complete functional solution, usually without needing to obtain anything from a third party.


```
