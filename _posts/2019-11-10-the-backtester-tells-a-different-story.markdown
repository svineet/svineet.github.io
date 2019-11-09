---
layout: post
title: the backtester tells a different story altogether
author: svineet
tags: trading quant code
published: false
---

Conventional wisdom in technical analysis tells a specific story about each indicator.

For example, when the RSI is below 20, you're supposed to say the stock is oversold and
treat it as a buy signal. This article is a look into how those stories change
at different frequencies of backtesting.

How good is `long when RSI crosses over 20` when you're at the 1 minute candle level? How
about a 15 minute candle instead?

To answer such questions, we must build a backtesting engine that tells us exactly what
would have happened, if for some part of history we would have

