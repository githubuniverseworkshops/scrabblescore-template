# Scrabblescore
> :capital_abcd: Easily derive word scores in [Scrabble](https://en.wikipedia.org/wiki/Scrabble)

<a href="https://github.com/swinton/scrabblescore"><img alt="GitHub Actions status" src="https://github.com/swinton/scrabblescore/workflows/Build/badge.svg"></a>

## Installation

```
npm i -S @scrabblescore/scrabblescore
```

## Usage

```javascript
const scrabble = require('@scrabblescore/scrabblescore');

const score = await scrabble.score('oxyphenbutazone');
console.log(score);  // returns 41
```
