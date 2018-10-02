const scrabble = require('..');

describe('scrabblescore', () => {
  it('calculates the correct score for a word', async () => {
    const score = await scrabble.score('oxyphenbutazone');
    expect(score).toBe(41);
  });
});
